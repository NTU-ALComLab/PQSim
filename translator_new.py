from qiskit import *
from qiskit.quantum_info.operators import Operator
from numpy import conjugate, pi, sqrt
#from qiskit.execute_function import execute
from qiskit.circuit.library import XGate, SGate, SdgGate, CPhaseGate
from qiskit.quantum_info import Statevector, DensityMatrix, partial_trace
#from qiskit.extensions import UnitaryGate
from qiskit.quantum_info import random_statevector
import random
import os
import numpy as np
from qiskit import qasm2, qasm3
from qiskit.quantum_info import StabilizerState, Pauli
import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)
warnings.filterwarnings("ignore", category=FutureWarning)
# XGate().control(num_ctrl_qubits=3,ctrl_state='000')
#font: Lucida Console

import builtins as __builtin__
import sys

class Gate():
    def __init__(self, gate_type, qubits):
        self._children = dict()
        self._parents = dict()
        self._type = gate_type
        self._qubits = qubits

        # for cuts
        self._in = dict()
        self._out = dict()

    def hasCliffordChild(self, index):
        return (self._children[index]._type not in ["t", "ccx", "end"])

    def countCliffordChildren(self):
        assert (self._type in ["t", "ccx"])
        count = 0
        for index in self._children:
            if self.hasCliffordChild(index):
                count += 1
        return count

    def setS(self):
        assert (self._type == "t")
        self._type = "s"

    def getType(self):
        return self._type

    def getQubits(self):
        return self._qubits

    def getChild(self, index):
        return self._children[index]

    def getParent(self, index):
        return self._parents[index]

    def addChild(self, index, gate):
        self._children[index] = gate

    def addParent(self, index, gate):
        self._parents[index] = gate

    def incChildrenCnt(self):
        for child_key in self._children:
            self._children[child_key]._count += 1

    def decChildrenCnt(self):
        new = []
        for child_key in self._children:
            child = self._children[child_key]
            assert (child._count > 0)
            child._count -= 1
            if (child._count == 0):
                new.append(child)
        return new

    def __repr__(self):
        return str(self._type) + ", " + str(self._qubits)

"""
x = Gate(123, 456)
y = Gate(789, 13)
x.addChild(5, y)
print(x._children)
y._type = 888
print(x._children)
0/0
"""

def print(*args, **kwargs):
    new_args = []
    for item in args:
        if type(item) == np.ndarray and item.dtype == np.dtype('bool'):
            new_args.append(item.astype(int))
        else:
            new_args.append(item)
    new_args = tuple(new_args)

    return __builtin__.print(*new_args, **kwargs)

def applyGate(qc, operation):
    (gate, qubits) = operation

    if gate=='h':
        qc.h(qubits[0])
    elif gate=='s':
        qc.s(qubits[0])
    elif gate=='sdg':
        qc.sdg(qubits[0])
    elif gate=='x':
        qc.x(qubits[0])
    elif gate=='y':
        qc.y(qubits[0])
    elif gate=='z':
        qc.z(qubits[0])
    elif gate=='cx':
        qc.cx(qubits[0], qubits[1])
    elif gate=='cz':
        qc.cz(qubits[0], qubits[1])
    elif gate=='swap':
        qc.swap(qubits[0], qubits[1])
    elif gate=='measure':
        pass
    else:
        raise Exception("%s not supported" % gate)
    return qc

def parseBlif(rfilename, wfilename):
    with open(rfilename) as file:
        data = file.read().replace(',', '').strip('\n').split('\n')

    # read file as graph
    gates = []
    headings = []
    for line in data:
        if line.find('//') != -1:
            line = line[:line.find('//')]
        line = line.strip('; ')
        if line == '':
            continue

        temp = line.split(' ')
        if temp[0] in ['OPENQASM', 'include', 'qreg', 'creg']:
            headings.append(line)
            if temp[0] == 'qreg':
                item = temp[1]
                n_qubits = int(item[ item.index('q[')+2 : item.index(']') ])
                qubit_slots = [None] * n_qubits
                for i in range(n_qubits):
                    new_gate = Gate("init", [i])
                    qubit_slots[i] = new_gate
        else:
            gate_type = temp[0]
            qubits = []
            for item in temp[1:]:
                qubits.append( int(item[ item.index('q[')+2 : item.index(']') ]) )

            # ignore starting CCX gates and T gates
            if gate_type == "ccx" and qubit_slots[qubits[0]].getType() == qubit_slots[qubits[1]].getType() == "init":
                continue
            if gate_type == "t" and qubit_slots[qubits[0]].getType() == "init":
                continue

            # merge two continuous T gates
            if gate_type == "t" and qubit_slots[qubits[0]].getType() == "t":
                qubit_slots[qubits[0]].setS()
                continue

            new_gate = Gate(gate_type, qubits)
            for qubit in qubits:
                new_gate.addParent(qubit, qubit_slots[qubit])
                qubit_slots[qubit].addChild(qubit, new_gate)
                qubit_slots[qubit] = new_gate
            gates.append(new_gate)

    for i in range(n_qubits):
        new_gate = Gate("end", [i])
        new_gate.addParent(i, qubit_slots[i])
        qubit_slots[i].addChild(i, new_gate)
        qubit_slots[i] = new_gate

    # count ancilla qubits
    n_ancilla = 0
    for gate in gates:
        if gate.getType() in ["t"]:
            n_ancilla += 2 * 1
        if gate.getType() in ["ccx"]:
            n_ancilla += 2 * 3

    # parse graph
    wfile =  open(wfilename, 'w')
    qc = QuantumCircuit(n_qubits + n_ancilla)

    ancilla_index = n_qubits
    t_gates = []
    ccx_gates = []
    n_cut = 0
    clifford_observables = dict()
    qubit_mapping = dict(zip(range(n_qubits), range(n_qubits)))

    for gate in gates:
        gate_type = gate.getType()
        qubits = gate.getQubits()

        if gate_type in ["t", "ccx"]:
            for ith_qubit in qubits:
                # fanin
                clifford_observables[qubit_mapping[ith_qubit]] = 'output of cut %d' % (n_cut)
                gate._in[ith_qubit] = n_cut
                n_cut += 1

                # fanout
                clifford_observables[ancilla_index + 1] = 'input of cut %d' % (n_cut)
                gate._out[ith_qubit] = n_cut
                n_cut += 1

                wfile.write('x q[%d];\n' % ancilla_index)
                wfile.write('h q[%d];\n' % ancilla_index)
                wfile.write('cx q[%d], q[%d];\n' % (ancilla_index, ancilla_index + 1) )
                wfile.write('x q[%d];\n' % (ancilla_index + 1))
                qc = applyGate(qc, ('x', [ancilla_index]))
                qc = applyGate(qc, ('h', [ancilla_index]))
                qc = applyGate(qc, ('cx', [ancilla_index, ancilla_index + 1]))
                qc = applyGate(qc, ('x', [ancilla_index + 1]))

                qubit_mapping[ith_qubit] = ancilla_index
                ancilla_index += 2

            # record
            if gate_type == "t":
                t_gates.append(gate)
            elif gate_type == "ccx":
                ccx_gates.append(gate)
            else:
                assert(False)
        else:
            wfile.write(gate_type + ' ')
            wfile.write(', '.join(map(lambda x: 'q[%d]' % qubit_mapping[x], qubits)))
            qc = applyGate(qc, (gate_type, list(map(lambda x: qubit_mapping[x], qubits))))
            wfile.write(';\n')

    assert (ancilla_index == n_qubits + n_ancilla)
    wfile.close()

    tableau = StabilizerState(qc).clifford.tableau
    for ith_qubit in range(n_qubits):
        clifford_observables[qubit_mapping[ith_qubit]] = 'original %d' % ith_qubit

    return (n_qubits + n_ancilla, t_gates, ccx_gates, clifford_observables, tableau, n_qubits, n_cut)

# ===========================================================

if __name__ == '__main__':
    if len(sys.argv) == 1:
        print("No input file")
        sys.exit()
    else:
        infile_name = sys.argv[1]
    outfile_name = infile_name[:-5] + "_out.qasm"
    (n_qubits_new, t_gates, ccx_gates, clifford_observables, tableau, n_qubits, n_cut) = parseBlif(infile_name, outfile_name)

    print('number of qubits:', n_qubits_new, '\n')
    print('number of T gates:', len(t_gates), '\n')
    print('number of CCX gates:', len(ccx_gates), '\n')

    print('Cifford measurements:')
    for i in range(n_qubits_new):
        print('  ', clifford_observables[i])
    print()

    q2idx = dict()

    print('T gates settings:')
    for i in range(len(t_gates)):
        gate = t_gates[i]
        ith_qubit = gate.getQubits()[0]
        q2idx[gate._in[ith_qubit]] = 't' + str(i)
        q2idx[gate._out[ith_qubit]] = 't' + str(i)
        if type(gate._in[ith_qubit]) == int:
            gate._in[ith_qubit] = 'input of cut %d' % gate._in[ith_qubit]
        if type(gate._out[ith_qubit]) == int:
            gate._out[ith_qubit] = 'output of cut %d' % gate._out[ith_qubit]
        print('  ', (gate._in[ith_qubit], gate._out[ith_qubit]))
    print()

    print('CCX gates settings:')
    for i in range(len(ccx_gates)):
        gate = ccx_gates[i]
        print('  ', end=' ')
        for j in range(len(gate.getQubits())):
            ith_qubit = gate.getQubits()[j]
            q2idx[gate._in[ith_qubit]] = 'ccx' + str(i) + "_" + str(j)
            q2idx[gate._out[ith_qubit]] = 'ccx' + str(i) + "_" + str(j)
            if type(gate._in[ith_qubit]) == int:
                gate._in[ith_qubit] = 'input of cut %d' % gate._in[ith_qubit]
            if type(gate._out[ith_qubit]) == int:
                gate._out[ith_qubit] = 'output of cut %d' % gate._out[ith_qubit]
            print((gate._in[ith_qubit], gate._out[ith_qubit]), end=' ')
        print()

    print(q2idx)

    # This is for new gate cuts method
    if len(ccx_gates) > 0:
        # calculate composition
        I = np.array([[1,0],[0,1]])
        X = np.array([[0,1],[1,0]])
        Y = np.array([[0,-1j],[1j,0]])
        Z = np.array([[1,0],[0,-1]])

        CCX = np.array([
            [1,0,0,0,0,0,0,0],
            [0,1,0,0,0,0,0,0],
            [0,0,1,0,0,0,0,0],
            [0,0,0,1,0,0,0,0],
            [0,0,0,0,1,0,0,0],
            [0,0,0,0,0,1,0,0],
            [0,0,0,0,0,0,0,1],
            [0,0,0,0,0,0,1,0]])

        pauli = [I,Z,X,Y]
        pauli_str = ['I','Z','X','Y']

        basis_dict = dict()

        for j0 in range(4):
            for j1 in range(4):
                for j2 in range(4):
                    q0 = pauli[j0]
                    q1 = pauli[j1]
                    q2 = pauli[j2]

                    target = np.kron(q0,np.kron(q1,q2))
                    target = np.matmul(CCX, target)
                    target = np.matmul(target, CCX)
                    pos = list()
                    neg = list()
                    for i0 in range(4):
                        for i1 in range(4):
                            for i2 in range(4):
                                p0 = pauli[i0]
                                p1 = pauli[i1]
                                p2 = pauli[i2]
                                basis = np.kron(p0, np.kron(p1,p2))
                                tr = np.trace(np.matmul(target,basis))
                                if abs(tr - 4) < 1e-3:
                                    pos.append(pauli_str[i0]+pauli_str[i1]+pauli_str[i2])
                                elif abs(tr + 4) < 1e-3:
                                    neg.append(pauli_str[i0]+pauli_str[i1]+pauli_str[i2])
                                elif abs(tr - 8) < 1e-3:
                                    pos.append(pauli_str[i0]+pauli_str[i1]+pauli_str[i2])
                    p_str = pauli_str[j0]+pauli_str[j1]+pauli_str[j2]
                    if len(pos) == 1:
                        basis_dict[p_str] = pos
                    elif len(pos) == 2:
                        basis_dict[p_str] = [pos[0],pos[1],'-'+neg[0],'-'+neg[1]]
                    elif len(pos) == 4:
                        basis_dict[p_str] = [pos[0],pos[1],pos[2],pos[3]]
                    else:
                        basis_dict[p_str] = [pos[0],pos[1],pos[2],'-'+neg[0]]

        # assign index
        idx = 0
        idx_dict = dict()
        for k,v in basis_dict.items():
            if len(v) == 1:
                idx_dict[idx] = [k,v[0],2]
                idx += 1
            else:
                idx_dict[idx] = [k,v[0] if '-' not in v[0] else v[0][1:],1 if '-' not in v[0] else -1]
                idx += 1
                idx_dict[idx] = [k,v[1] if '-' not in v[1] else v[1][1:],1 if '-' not in v[1] else -1]
                idx += 1
                idx_dict[idx] = [k,v[2] if '-' not in v[2] else v[2][1:],1 if '-' not in v[2] else -1]
                idx += 1
                idx_dict[idx] = [k,v[3] if '-' not in v[3] else v[3][1:],1 if '-' not in v[3] else -1]
                idx += 1

        pauli_encoding = {'I' : '00', 'Z' : '01', 'X' : '10', 'Y' : '11'}

    # Part 1 : Clifford measurements (for setup)
    v_part1 = ''
    for i in range(n_qubits_new):
        obs_str = clifford_observables[i]
        if obs_str == "I":
            v_part1 += "basis_w[" + str(i) + "] = 2'b00;\n"
            v_part1 += "result_w[" + str(i) + "] = 2'b00;\n"
        else:
            target = int(obs_str.split(' ')[-1])
            if 'input' in obs_str:
                v_part1 += "basis_w[" + str(i) + "] = 2'b00;\n"
                v_part1 += "result_w[" + str(i) + "] = 2'b00;\n"
            elif 'output' in obs_str:
                v_part1 += "basis_w[" + str(i) + "] = 2'b00;\n"
                v_part1 += "result_w[" + str(i) + "] = 2'b00;\n"
            else:
                v_part1 += "basis_w[" + str(i) + "] = (i_basis_r[" + str(4*target+3) + " -: 2] == 2'b00)? 2'b00 : i_basis_r[" + str(4*target+1) + " -: 2];\n"
                v_part1 += "result_w[" + str(i) + "] = (i_basis_r[" + str(4*target+3) + " -: 2] == 2'b00)? 2'b00 : i_basis_r[" + str(4*target+3) + " -: 2];\n"
    # print("v_part1 : ", v_part1, sep = '\n')
    with open('./cliffordT_template/core_template.v','r') as infile:
        lines = infile.read().split('\n')
        for i in range(len(lines)):
            if lines[i] == "//@1":
                lines[i] += '\n' + v_part1

    with open('./cliffordT_template/core.v','w') as outfile:
        outfile.write('\n'.join(lines))

    # Part 1x : Clifford measurements (for iterate)
    v_part1x = ''
    for i in range(n_qubits_new):
        obs_str = clifford_observables[i]
        if obs_str == "I":
            v_part1x += "basis_w[" + str(i) + "] = 2'b00;\n"
            v_part1x += "result_w[" + str(i) + "] = 2'b00;\n"
        else:
            target = int(obs_str.split(' ')[-1])
            if 'output' in obs_str:
                idx = q2idx[target]
                gate_type = 'T' if 't' in idx else 'CCX'
                if gate_type == 'T':
                    target = int(idx[1:])
                    # IXXYYZ
                    v_part1x += "case (cnt_r[" + str(target) + "])\n"
                    for j in range(6):
                        v_part1x += "\t3'd" + str(j) + " : "
                        if j == 0:
                            v_part1x += "begin " + "basis_w[" + str(i) + "] = 2'b00; "
                        elif j in [1,2]:
                            v_part1x += "begin " + "basis_w[" + str(i) + "] = 2'b10; "
                        elif j in [3,4]:
                            v_part1x += "begin " + "basis_w[" + str(i) + "] = 2'b11; "
                        else:
                            v_part1x += "begin " + "basis_w[" + str(i) + "] = 2'b01; "
                        v_part1x += "result_w[" + str(i) + "] = 2'b00; end\n"
                    v_part1x += "\tdefault : begin " + "basis_w[" + str(i) + "] = 2'b00; " + "result_w[" + str(i) + "] = 2'b00; end\n"
                else:
                    target = int(idx.split('_')[0][3:])
                    targetX = int(idx.split('_')[1])
                    v_part1x += "case (cnt_r[" + str(target) + "])\n"
                    for k,v in idx_dict.items():
                        v_part1x += "\t8'd%i : begin "%(k)
                        v_part1x += "basis_w[%i] = 2'b%s; result_w[%i] = 2'b00; end\n" %(i, pauli_encoding[v[0][targetX]], i)
                v_part1x += "endcase\n"
            elif 'input' in obs_str:
                idx = q2idx[target]
                gate_type = 'T' if 't' in idx else 'CCX'
                if gate_type == 'T':
                    target = int(idx[1:])
                    # IXYYXZ
                    v_part1x += "case (cnt_r[" + str(target) + "])\n"
                    for j in range(6):
                        v_part1x += "\t3'd" + str(j) + " : "
                        if j == 0:
                            v_part1x += "begin " + "basis_w[" + str(i) + "] = 2'b00; "
                        elif j in [1,4]:
                            v_part1x += "begin " + "basis_w[" + str(i) + "] = 2'b10; "
                        elif j in [2,3]:
                            v_part1x += "begin " + "basis_w[" + str(i) + "] = 2'b11; "
                        else:
                            v_part1x += "begin " + "basis_w[" + str(i) + "] = 2'b01; "
                        v_part1x += "result_w[" + str(i) + "] = 2'b00; end\n"
                    v_part1x += "\tdefault : begin " + "basis_w[" + str(i) + "] = 2'b00; " + "result_w[" + str(i) + "] = 2'b00; end\n"
                else:
                    target = int(idx.split('_')[0][3:])
                    targetX = int(idx.split('_')[1])
                    v_part1x += "case (cnt_r[" + str(target) + "])\n"
                    for k,v in idx_dict.items():
                        v_part1x += "\t8'd%i : begin "%(k)
                        v_part1x += "basis_w[%i] = 2'b%s; result_w[%i] = 2'b00; end\n" %(i, pauli_encoding[v[1][targetX]], i)
                v_part1x += "endcase\n"
            else:
                v_part1x += "basis_w[" + str(i) + "] = (i_basis_r[" + str(4*target+3) + " -: 2] == 2'b00)? i_basis_r[" + str(4*target+1) + " -: 2] : 2'b00;\n"
                v_part1x += "result_w[" + str(i) + "] = (i_basis_r[" + str(4*target+3) + " -: 2] == 2'b00)? i_basis_r[" + str(4*target+3) + " -: 2] : 2'b00;\n"
    # print("v_part1x : ", v_part1x, sep = '\n')
    with open('./cliffordT_template/core.v','r') as infile:
        lines = infile.read().split('\n')
        for i in range(len(lines)):
            if lines[i] == "//@1x":
                lines[i] += '\n' + v_part1x

    with open('./cliffordT_template/core.v','w') as outfile:
        outfile.write('\n'.join(lines))

    # Part 2 : multiplication for T and CCXgates
    # We don't need LUT in this method
    v_part2 = ''
    v_part2 = "case (multi_cnt_r)\n"

    for i in range(len(t_gates)):
        v_part2 += "\t4'd" + str(i) + " : begin\n"
        v_part2 += "\t\t//T " + str(i) + "\n"
        v_part2 += "\t\tcase (cnt_r[%d])"%(i)
        v_part2 += '''
            3'd0 : begin
                o_temp_a_w = o_temp_a_r <<< 1;
                o_temp_b_w = o_temp_b_r <<< 1;
            end
            3'd1 : begin
                o_temp_a_w = -(o_temp_b_r <<< 1);
                o_temp_b_w = -(o_temp_a_r);
            end
            3'd2 : begin
                o_temp_a_w = -(o_temp_b_r <<< 1);
                o_temp_b_w = -(o_temp_a_r);
            end
            3'd3 : begin
                o_temp_a_w = -(o_temp_b_r <<< 1);
                o_temp_b_w = -(o_temp_a_r);
            end
            3'd4 : begin
                o_temp_a_w = o_temp_b_r <<< 1;
                o_temp_b_w = o_temp_a_r;
            end
            3'd5 : begin
                o_temp_a_w = -(o_temp_a_r <<< 1);
                o_temp_b_w = -(o_temp_b_r <<< 1);
            end
            default : begin
                o_temp_a_w = 0;
                o_temp_b_w = 0;
            end
        endcase'''
        v_part2 += "\tend\n"
    for i in range(len(ccx_gates)):
        v_part2 += "\t4'd" + str(i + len(t_gates)) + " : begin\n"
        v_part2 += "\t\t//CCX " + str(i) + "\n"
        v_part2 += "\t\tcase (cnt_r[%d])\n"%(i + len(t_gates))
        # generate coefficients
        two_idx = list()
        minus_two_idx = list()
        one_idx = list()
        minus_one_idx = list()
        for k,v in idx_dict.items():
            value = v[2]
            # Delay preparations
            for p in v[1]:
                if p != 'I':
                    value = -value
            if value == 2:
                two_idx.append(k)
            elif value == -2:
                minus_two_idx.append(k)
            elif value == 1:
                one_idx.append(k)
            else:
                minus_one_idx.append(k)
        v_part2 += "\t\t\t" + ', '.join(["8'd%i"%(two_idx[i]) + ('\n\t\t\t' if i%5 == 4 and i != 0 else '') for i in range(len(two_idx))])
        v_part2 += " : begin\n"
        v_part2 += "\t\t\t\to_temp_a_w = o_temp_a_r <<< 1;\n"
        v_part2 += "\t\t\t\to_temp_b_w = o_temp_b_r <<< 1;\n"
        v_part2 += "\t\t\tend\n"
        v_part2 += "\t\t\t" + ', '.join(["8'd%i"%(minus_two_idx[i]) + ('\n\t\t\t' if i%5 == 4 and i != 0 else '') for i in range(len(minus_two_idx))])
        v_part2 += " : begin\n"
        v_part2 += "\t\t\t\to_temp_a_w = -(o_temp_a_r <<< 1);\n"
        v_part2 += "\t\t\t\to_temp_b_w = -(o_temp_b_r <<< 1);\n"
        v_part2 += "\t\t\tend\n"
        v_part2 += "\t\t\t" + ', '.join(["8'd%i"%(one_idx[i]) + ('\n\t\t\t' if i%5 == 4 and i != 0 else '') for i in range(len(one_idx))])
        v_part2 += " : begin\n"
        v_part2 += "\t\t\t\to_temp_a_w = o_temp_a_r;\n"
        v_part2 += "\t\t\t\to_temp_b_w = o_temp_b_r;\n"
        v_part2 += "\t\t\tend\n"
        v_part2 += "\t\t\t" + ', '.join(["8'd%i"%(minus_one_idx[i]) + ('\n\t\t\t' if i%5 == 4 and i != 0 else '') for i in range(len(minus_one_idx))])
        v_part2 += " : begin\n"
        v_part2 += "\t\t\t\to_temp_a_w = -(o_temp_a_r);\n"
        v_part2 += "\t\t\t\to_temp_b_w = -(o_temp_b_r);\n"
        v_part2 += "\t\t\tend\n"
        v_part2 += "\t\tendcase\n"
        v_part2 += "\tend\n"

    v_part2 += "\t4'd" + str(len(t_gates) + len(ccx_gates)) + " : begin\n"
    v_part2 += "\t\to_a_w = o_a_r + o_temp_a_r;\n"
    v_part2 += "\t\to_b_w = o_b_r + o_temp_b_r;\n"
    v_part2 += "\t\tstate_w = S_MEASURE;\n"
    v_part2 += "\t\t// Update counter\n"
    for i in range(len(t_gates)):
        v_part2 += "\t\t" + ("\t" * i) + "if (cnt_r[" + str(i) + "] == 3'd5) begin\n"
        v_part2 += "\t\t\t" + ("\t" * i) + "cnt_w[" + str(i) + "] = 3'd0;\n"
    for i in range(len(ccx_gates)):
        v_part2 += "\t\t" + ("\t" * i) + "if (cnt_r[" + str(i) + "] == 8'd231) begin\n"
        v_part2 += "\t\t\t" + ("\t" * i) + "cnt_w[" + str(i) + "] = 8'd0;\n"
    v_part2 += ("\t" * (2 + len(t_gates) + len(ccx_gates))) + "state_w = S_IDLE;\n"
    v_part2 += ("\t" * (2 + len(t_gates) + len(ccx_gates))) + "o_finish_w = 1'b1;\n"
    for i in range(len(t_gates) + len(ccx_gates) - 1, -1, -1):
        v_part2 += "\t\t" + ("\t" * i) + "end\n"
        v_part2 += "\t\t" + ("\t" * i) + "else begin\n"
        v_part2 += "\t\t\t" + ("\t" * i) + "cnt_w[" + str(i) + "] = cnt_r[" + str(i) + "] + 3'd1;\n"
        v_part2 += "\t\t" + ("\t" * i) + "end\n"
    v_part2 += "\t\tmulti_cnt_w = 4'd0;\n"
    v_part2 += "\tend\n"
    v_part2 += "\tdefault : begin\n"
    v_part2 += "\tend\n"
    v_part2 += "endcase"

    # print("v_part2 : ", v_part2, sep = '\n')
    with open('./cliffordT_template/Core.v','r') as infile:
        lines = infile.read().split('\n')
        for i in range(len(lines)):
            if lines[i] == "//@2":
                lines[i] += '\n' + v_part2

    with open('./cliffordT_template/Core.v','w') as outfile:
        outfile.write('\n'.join(lines))

    print('Tableau of main Clifford circuit:')
    print(tableau)

    # Part 3 : measureClifford.v
    v_part3 = ''
    tableau_str = [''.join([str(int(element)) for element in row]) for row in tableau]
    v_part3 = '\n'.join(["nxt_tableau[" + str(i) + "] = `WIDTH'b" + s + ";" for i,s in enumerate(tableau_str)])
    # print("v_part3 : ", v_part3, sep = '\n')
    with open('./cliffordT_template/measureClifford_template.v','r') as infile:
        lines = infile.read().split('\n')
        for i in range(len(lines)):
            if lines[i] == "//@3":
                lines[i] += '\n' + v_part3

    with open('./cliffordT_template/measureClifford.v','w') as outfile:
        outfile.write('\n'.join(lines))

    # Part 4 : define.v
    max_input_bits = 4 * n_qubits + 4 * (n_qubits % 2)
    max_output_bits_1 = 16
    max_output_bits_2 = 48

    v_part4 = ''
    # print(n_qubits, n_qubits_new, n_cut, n_t, 2*n_qubits_new+1)
    v_part4 += "`define NUM_QUBITS " + str(n_qubits) + '\n'
    v_part4 += "`define NUM_TOTAL_QUBITS " + str(n_qubits_new) + '\n'
    v_part4 += "`define NUM_CUTS " + str(len(t_gates) + len(ccx_gates)) + '\n' # cut number = T + CCX gate number
    v_part4 += "`define NUM_TGATES " + str(len(t_gates)) + '\n'
    v_part4 += "`define NUM_CCXGATES " + str(len(ccx_gates)) + '\n'
    v_part4 += "`define WIDTH " + str(2*n_qubits_new+1) + '\n\n'
    v_part4 += "`define MAX_INPUT_BITS " + str(max_input_bits) + '\n'
    v_part4 += "`define MAX_OUTPUT_BITS_1 " + str(max_output_bits_1) + '\n'
    v_part4 += "`define MAX_OUTPUT_BITS_2 " + str(max_output_bits_2) + '\n'
    # print("v_part4 : ", v_part4, sep = '\n')
    with open('./cliffordT_template/define_template.v','r') as infile:
        lines = infile.read().split('\n')
        for i in range(len(lines)):
            if lines[i] == "//@4":
                lines[i] += '\n' + v_part4

    with open('./cliffordT_template/define.v','w') as outfile:
        outfile.write('\n'.join(lines))
