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
import cirq
import cutting_methods as cm
from typing import (
    Optional,
    Callable,
    Dict,
    Iterable,
    Iterator,
    List,
    Literal,
    Mapping,
    Optional,
    Sequence,
    Tuple,
)
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
    

def print(*args, **kwargs):
    new_args = []
    for item in args:
        if type(item) == np.ndarray and item.dtype == np.dtype('bool'):
            new_args.append(item.astype(int))
        else:
            new_args.append(item)
    new_args = tuple(new_args)
    
    return __builtin__.print(*new_args, **kwargs)

def applyGate(qc_ptr, operation, qubits_list):
    (gate, qubits) = operation

    if gate=='h':
        qc_ptr[0].append(cirq.H(qubits_list[qubits[0]]))
    elif gate=='s':
        qc_ptr[0].append(cirq.S(qubits_list[qubits[0]]))
    elif gate=='sdg':
        qc_ptr[0].append(cirq.Z(qubits_list[qubits[0]]))
        qc_ptr[0].append(cirq.S(qubits_list[qubits[0]]))
    elif gate=='x':
        qc_ptr[0].append(cirq.X(qubits_list[qubits[0]]))
    elif gate=='y':
        qc_ptr[0].append(cirq.Y(qubits_list[qubits[0]]))
    elif gate=='z':
        qc_ptr[0].append(cirq.Z(qubits_list[qubits[0]]))
    elif gate=='cx':
        qc_ptr[0].append(cirq.CNOT(qubits_list[qubits[0]], qubits_list[qubits[1]]))
    elif gate=='cz':
        qc_ptr[0].append(cirq.CZ(qubits_list[qubits[0]], qubits_list[qubits[1]]))
    elif gate=='swap':
        qc_ptr[0].append(cirq.SWAP(qubits_list[qubits[0]], qubits_list[qubits[1]]))
    else:
        raise Exception("%s not supported" % gate)
    return

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
            n_ancilla += gate.countCliffordChildren()
    
    # parse graph
    wfile =  open(wfilename, 'w')
    wfile.write('OPENQASM 2.0;\ninclude "qelib1.inc";\nqreg q[%d];\n' % (n_qubits + n_ancilla))

    qc = cirq.Circuit()
    qubits_list = []
    all_qubits = set()
    quantum_inputs = dict()
    quantum_outputs = dict()
    for i in range(n_qubits):
        qubits_list.append(cirq.NamedQubit('c_0_%d' % i))
        all_qubits.add(qubits_list[-1])
    
    ancilla_index = n_qubits
    t_gates = []
    ccx_gates = []
    n_cut = 0
    clifford_observables = dict()
    clifford_inputs = dict()
    for i in range(n_qubits):
        clifford_inputs[i] = "original %d" % i
        
    qubit_mapping = dict(zip(range(n_qubits), range(n_qubits)))
    for gate in gates:
        gate_type = gate.getType()
        qubits = gate.getQubits()

        if gate_type in ["t", "ccx"]:
            for ith_qubit in qubits:
                # fanin
                if gate.getParent(ith_qubit).getType() == "init":
                    clifford_observables[qubit_mapping[ith_qubit]] = "I"   # lazy approach; avoid re-indexing
                    all_qubits.remove(qubits_list[qubit_mapping[ith_qubit]])
                    gate._in[ith_qubit] = "original %d" % ith_qubit # HERE v3
                elif gate.getParent(ith_qubit).getType() in ["t", "ccx"]:
                    gate._in[ith_qubit] = gate.getParent(ith_qubit)._out[ith_qubit]
                else:
                    quantum_outputs[qubits_list[qubit_mapping[ith_qubit]]] = 'cut_%d' % n_cut
                    
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
                    new_qubit = cirq.NamedQubit('cut_%d' % n_cut)
                    qubits_list.append(new_qubit)
                    all_qubits.add(qubits_list[-1])
                    quantum_inputs[new_qubit] = 'cut_%d' % n_cut

                    clifford_inputs[ancilla_index] = "input of cut %d" % n_cut
                    gate._out[ith_qubit] = n_cut
                    n_cut += 1
                    
                    qubit_mapping[ith_qubit] = ancilla_index
                    ancilla_index += 1
                    
            # record
            if gate_type == "t":
                t_gates.append(gate)
            elif gate_type == "ccx":
                ccx_gates.append(gate)
            else:
                assert(False)
        else:
            applyGate([qc], (gate_type, list(map(lambda x: qubit_mapping[x], qubits))), qubits_list)
            wfile.write(gate_type + ' ')
            wfile.write(', '.join(map(lambda x: 'q[%d]' % qubit_mapping[x], qubits)))
            wfile.write(';\n')
            
    assert (ancilla_index == n_qubits + n_ancilla == len(qubits_list))
    wfile.close()

    """
    qubit_trans = dict()
    for qubit in all_qubits:
        qubit_trans[qubit] = qubit
    """ # HERE v3
    for ith_qubit in range(n_qubits):
        ending_gate = qubit_slots[ith_qubit]
        tmp1 = ending_gate.getParent(ending_gate.getQubits()[0]).getType() not in ["t", "ccx"]
        tmp2 = qubit_mapping[ith_qubit] not in clifford_observables
        assert(tmp1 == tmp2)
        if tmp1:
            clifford_observables[qubit_mapping[ith_qubit]] = 'original %d' % ith_qubit
            """
            new_qubit = cirq.NamedQubit('original q%d' % ith_qubit)
            qubit_trans[qubits_list[qubit_mapping[ith_qubit]]] = new_qubit
            if qubits_list[qubit_mapping[ith_qubit]] in quantum_inputs:
                quantum_inputs[new_qubit] = quantum_inputs[qubits_list[qubit_mapping[ith_qubit]]]
                del quantum_inputs[qubits_list[qubit_mapping[ith_qubit]]]
            if qubits_list[qubit_mapping[ith_qubit]] in quantum_outputs:
                quantum_outputs[new_qubit] = quantum_outputs[qubits_list[qubit_mapping[ith_qubit]]]
                del quantum_outputs[qubits_list[qubit_mapping[ith_qubit]]]
            """ # HERE v3

    # qc = qc.transform_qubits(qubit_trans) # HERE v3

    return (n_qubits + n_ancilla, t_gates, ccx_gates, clifford_inputs, clifford_observables, (qc, quantum_inputs, quantum_outputs))


def get_fragments_from_file(filename, outname):
# ===========================================================
    fragment = dict()
    (n_qubits_new, t_gates, ccx_gates, clifford_inputs, clifford_observables, (clifford_circuit, quantum_inputs, quantum_outputs)) = parseBlif("test.qasm", "test_out.qasm")
    fragment['fragment_0'] = (cm.Fragment(clifford_circuit, quantum_inputs, quantum_outputs))
    frag_num = 1
        
    print('number of qubits:', n_qubits_new, '\n')
    print('number of T gates:', len(t_gates), '\n')
    print('number of CCX gates:', len(ccx_gates), '\n')

    print('Cifford inputs:')
    for i in range(n_qubits_new):
        print('  ', clifford_inputs[i])
    print()
    
    print('Cifford measurements:')
    for i in range(n_qubits_new):
        print('  ', clifford_observables[i])
    print()
    
    print('T gates settings:')
    for (ith_gate, gate) in enumerate(t_gates):
        qc = cirq.Circuit()
        qubits_list = []
        quantum_inputs = dict()
        quantum_outputs = dict()
        qubit_trans = dict()
        
        for (ith_qubit, qubit) in enumerate(gate.getQubits()):
            if type(gate._in[qubit]) == int:
                new_qubit = cirq.NamedQubit('cut_%d' % gate._in[qubit])
                quantum_inputs[new_qubit] = 'cut_%d' % gate._in[qubit]
                gate._in[qubit] = 'input of cut %d' % gate._in[qubit]
            elif "original" in gate._in[qubit]: # HERE v3
                new_qubit = cirq.NamedQubit('c_0_%d' % int(gate._in[qubit].strip('original'))) # HERE v3
            else:
                assert(False)
            qubits_list.append(new_qubit)
            qubit_trans[new_qubit] = new_qubit
            

            if type(gate._out[qubit]) == int:
                quantum_outputs[new_qubit] = 'cut_%d' % gate._out[qubit]
                gate._out[qubit] = 'output of cut %d' % gate._out[qubit]
            """
            elif gate._out[qubit].startswith('original'):
                new_qubit_2 = cirq.NamedQubit('original q%d' % int(gate._out[qubit].replace('original ','')))
                qubit_trans[new_qubit] = new_qubit_2
                if new_qubit in quantum_inputs:
                    quantum_inputs[new_qubit_2] = quantum_inputs[new_qubit]
                    del quantum_inputs[new_qubit]
                if new_qubit in quantum_outputs:
                    quantum_outputs[new_qubit_2] = quantum_inputs[new_qubit]
                    del quantum_inputs[new_qubit]
            else:
                assert(False)
            """  # HERE v3

            print('  ', (gate._in[qubit], gate._out[qubit]), end=' ')
        print()
        
        qc.append(cirq.T(qubits_list[0]))
        qc = qc.transform_qubits(qubit_trans)
        fragment[f'fragment_{frag_num}'] = (cm.Fragment(qc, quantum_inputs, quantum_outputs))
        frag_num += 1
        
        
    print()
    
    print('CCX gates settings:')
    for (ith_gate, gate) in enumerate(ccx_gates):
        qc = cirq.Circuit()
        qubits_list = []
        quantum_inputs = dict()
        quantum_outputs = dict()
        qubit_trans = dict()
        
        for (ith_qubit, qubit) in enumerate(gate.getQubits()):
            if type(gate._in[qubit]) == int:
                new_qubit = cirq.NamedQubit('cut_%d' % gate._in[qubit])
                quantum_inputs[new_qubit] = 'cut_%d' % gate._in[qubit]
                gate._in[qubit] = 'input of cut %d' % gate._in[qubit]
            elif "original" in gate._in[qubit]: # HERE v3
                new_qubit = cirq.NamedQubit('c_0_%d' % int(gate._in[qubit].strip('original'))) # HERE v3
            else:
                assert(False)
            qubits_list.append(new_qubit)
            qubit_trans[new_qubit] = new_qubit
            
            
            if type(gate._out[qubit]) == int:
                quantum_outputs[new_qubit] = 'cut_%d' % gate._out[qubit]
                gate._out[qubit] = 'output of cut %d' % gate._out[qubit]
            """ 
            elif gate._out[qubit].startswith('original'):
                new_qubit_2 = cirq.NamedQubit('original q%d' % int(gate._out[qubit].replace('original ','')))
                qubit_trans[new_qubit] = new_qubit_2
                if new_qubit in quantum_inputs:
                    quantum_inputs[new_qubit_2] = quantum_inputs[new_qubit]
                    del quantum_inputs[new_qubit] 
                if new_qubit in quantum_outputs:
                    quantum_outputs[new_qubit_2] = quantum_outputs[new_qubit]
                    del quantum_outputs[new_qubit]
            else:
                assert(False)
            """  # HERE v3

            print('  ', (gate._in[qubit], gate._out[qubit]), end=' ')
        print()

        qc.append(cirq.CCX(qubits_list[0], qubits_list[1], qubits_list[2]))
        qc = qc.transform_qubits(qubit_trans)
        fragment[f'fragment_{frag_num}'] = (cm.Fragment(qc, quantum_inputs, quantum_outputs))
        frag_num += 1
        
    return fragment
    
if __name__ == '__main__':
    fragment = get_fragments_from_file(filename, outname)
    # fragment = []
    # (n_qubits_new, t_gates, ccx_gates, clifford_inputs, clifford_observables, (clifford_circuit, quantum_inputs, quantum_outputs)) = parseBlif("test.qasm", "test_out.qasm")
    # fragment.append(cm.Fragment(clifford_circuit, quantum_inputs, quantum_outputs))
        
    # print('number of qubits:', n_qubits_new, '\n')
    # print('number of T gates:', len(t_gates), '\n')
    # print('number of CCX gates:', len(ccx_gates), '\n')

    # print('Cifford inputs:')
    # for i in range(n_qubits_new):
    #     print('  ', clifford_inputs[i])
    # print()
    
    # print('Cifford measurements:')
    # for i in range(n_qubits_new):
    #     print('  ', clifford_observables[i])
    # print()
    
    # print('T gates settings:')
    # for (ith_gate, gate) in enumerate(t_gates):
    #     qc = cirq.Circuit()
    #     qubits_list = []
    #     quantum_inputs = dict()
    #     quantum_outputs = dict()
    #     qubit_trans = dict()
        
    #     for (ith_qubit, qubit) in enumerate(gate.getQubits()):
    #         if type(gate._in[qubit]) == int:
    #             new_qubit = cirq.NamedQubit('cut_%d' % gate._in[qubit])
    #             quantum_inputs[new_qubit] = 'cut_%d' % gate._in[qubit]
    #             gate._in[qubit] = 'input of cut %d' % gate._in[qubit]
    #         elif gate._in[qubit] == "0":
    #             new_qubit = cirq.NamedQubit('c_%d_%d' % (ith_gate + 1, ith_qubit))
    #         else:
    #             assert(False)
    #         qubits_list.append(new_qubit)
    #         qubit_trans[new_qubit] = new_qubit
            

    #         if type(gate._out[qubit]) == int:
    #             quantum_outputs[new_qubit] = 'cut_%d' % gate._out[qubit]
    #             gate._out[qubit] = 'output of cut %d' % gate._out[qubit]
    #         elif gate._out[qubit].startswith('original'):
    #             new_qubit_2 = cirq.NamedQubit('original q%d' % int(gate._out[qubit].replace('original ','')))
    #             qubit_trans[new_qubit] = new_qubit_2
    #             if new_qubit in quantum_inputs:
    #                 quantum_inputs[new_qubit_2] = quantum_inputs[new_qubit]
    #                 del quantum_inputs[new_qubit]
    #             if new_qubit in quantum_outputs:
    #                 quantum_outputs[new_qubit_2] = quantum_inputs[new_qubit]
    #                 del quantum_inputs[new_qubit]
    #         else:
    #             assert(False)

    #         print('  ', (gate._in[qubit], gate._out[qubit]), end=' ')
    #     print()
        
    #     qc.append(cirq.T(qubits_list[0]))
    #     qc = qc.transform_qubits(qubit_trans)
    #     fragment.append(cm.Fragment(qc, quantum_inputs, quantum_outputs))
        
        
    # print()
    
    # print('CCX gates settings:')
    # for (ith_gate, gate) in enumerate(ccx_gates):
    #     qc = cirq.Circuit()
    #     qubits_list = []
    #     quantum_inputs = dict()
    #     quantum_outputs = dict()
    #     qubit_trans = dict()
        
    #     for (ith_qubit, qubit) in enumerate(gate.getQubits()):
    #         if type(gate._in[qubit]) == int:
    #             new_qubit = cirq.NamedQubit('cut_%d' % gate._in[qubit])
    #             quantum_inputs[new_qubit] = 'cut_%d' % gate._in[qubit]
    #             gate._in[qubit] = 'input of cut %d' % gate._in[qubit]
    #         elif gate._in[qubit] == "0":
    #             new_qubit = cirq.NamedQubit('c_%d_%d' % (ith_gate + 1, ith_qubit))
    #         else:
    #             assert(False)
    #         qubits_list.append(new_qubit)
    #         qubit_trans[new_qubit] = new_qubit
            

    #         if type(gate._out[qubit]) == int:
    #             quantum_outputs[new_qubit] = 'cut_%d' % gate._out[qubit]
    #             gate._out[qubit] = 'output of cut %d' % gate._out[qubit]
    #         elif gate._out[qubit].startswith('original'):
    #             new_qubit_2 = cirq.NamedQubit('original q%d' % int(gate._out[qubit].replace('original ','')))
    #             qubit_trans[new_qubit] = new_qubit_2
    #             if new_qubit in quantum_inputs:
    #                 quantum_inputs[new_qubit_2] = quantum_inputs[new_qubit]
    #                 del quantum_inputs[new_qubit] 
    #             if new_qubit in quantum_outputs:
    #                 quantum_outputs[new_qubit_2] = quantum_outputs[new_qubit]
    #                 del quantum_outputs[new_qubit]
    #         else:
    #             assert(False)

    #         print('  ', (gate._in[qubit], gate._out[qubit]), end=' ')
    #     print()

    #     qc.append(cirq.CCX(qubits_list[0], qubits_list[1], qubits_list[2]))
    #     qc = qc.transform_qubits(qubit_trans)
    #     fragment.append(cm.Fragment(qc, quantum_inputs, quantum_outputs))
        
        
