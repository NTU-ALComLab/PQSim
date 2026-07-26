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
        if gate.getType() in ["t", "ccx"]:
            n_ancilla += 2 * gate.countCliffordChildren()
    
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
                if gate.getParent(ith_qubit).getType() == "init":
                    clifford_observables[qubit_mapping[ith_qubit]] = "I"
                    gate._in[ith_qubit] = "0"  # lazy approach; avoid re-indexing
                elif gate.getParent(ith_qubit).getType() in ["t", "ccx"]:
                    gate._in[ith_qubit] = gate.getParent(ith_qubit)._out[ith_qubit]
                else:
                    clifford_observables[qubit_mapping[ith_qubit]] = 'output of cut %d' % n_cut
                    gate._in[ith_qubit] = n_cut
                    n_cut += 1

                # fanout
                if gate.getChild(ith_qubit).getType() == "end":
                    gate._out[ith_qubit] = "original %d" % ith_qubit
                elif gate.getChild(ith_qubit).getType() in ["t", "ccx"]:
                    gate._out[ith_qubit] = n_cut
                    n_cut += 1
                else:
                    clifford_observables[ancilla_index + 1] = 'input of cut %d' % n_cut
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
        ending_gate = qubit_slots[ith_qubit]
        tmp1 = ending_gate.getParent(ending_gate.getQubits()[0]).getType() not in ["t", "ccx"]
        tmp2 = qubit_mapping[ith_qubit] not in clifford_observables
        assert(tmp1 == tmp2)
        if tmp1:
            clifford_observables[qubit_mapping[ith_qubit]] = 'original %d' % ith_qubit

    return (n_cut, n_qubits, n_qubits + n_ancilla, t_gates, ccx_gates, clifford_observables, tableau)

# ===========================================================
observable_map_filename = "observable_map.txt"
if __name__ == '__main__':
    (n_cut, n_qubits_old, n_qubits_new, t_gates, ccx_gates, clifford_observables, tableau) = parseBlif(sys.argv[1], 'temp_nothing.qasm')

    with open(sys.argv[2], 'w') as f:
        f.write('number of qubits: {}\n\n'.format(n_qubits_new))
        f.write('number of T gates: {}\n\n'.format(len(t_gates)))
        f.write('number of CCX gates: {}\n\n'.format(len(ccx_gates)))
        
        f.write('Clifford measurements:\n')
        for i in range(n_qubits_new):
            f.write('{}\n'.format(clifford_observables[i]))
        f.write('\n')
        
        f.write('T gates settings:\n')
        for gate in t_gates:
            ith_qubit = gate.getQubits()[0]
            if type(gate._in[ith_qubit]) == int:
                gate._in[ith_qubit] = 'input of cut %d' % gate._in[ith_qubit]
            if type(gate._out[ith_qubit]) == int:
                gate._out[ith_qubit] = 'output of cut %d' % gate._out[ith_qubit]
            f.write('{}\n'.format(gate._in[ith_qubit]))
            f.write('{}\n'.format(gate._out[ith_qubit]))
        f.write('\n')
        
        f.write('CCX gates settings:\n')
        for gate in ccx_gates:
            for ith_qubit in gate.getQubits():
                if type(gate._in[ith_qubit]) == int:
                    gate._in[ith_qubit] = 'input of cut %d' % gate._in[ith_qubit]
                if type(gate._out[ith_qubit]) == int:
                    gate._out[ith_qubit] = 'output of cut %d' % gate._out[ith_qubit]
                f.write('{}\n'.format(gate._in[ith_qubit]))
                f.write('{}\n'.format(gate._out[ith_qubit]))
            f.write('\n')
        
        f.write('\n')
        
        f.write('Tableau of main Clifford circuit:\n')
        np.savetxt(f, tableau, fmt='%d')
        
        print(n_qubits_old)
        print(n_qubits_new)
        print(n_cut)
