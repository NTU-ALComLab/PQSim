from qiskit import *
from qiskit.quantum_info.operators import Operator
from numpy import conjugate, pi, sqrt
#from qiskit.execute_function import execute
from qiskit.circuit.library import XGate, SGate, SdgGate, CPhaseGate
from qiskit.quantum_info import Statevector, DensityMatrix, partial_trace
#from qiskit.extensions import UnitaryGate
from qiskit.quantum_info import random_statevector
import random
import numpy as np
from qiskit import qasm2, qasm3
from qiskit.quantum_info import StabilizerState, Pauli
import time
import warnings
warnings.filterwarnings("ignore", category=DeprecationWarning)
warnings.filterwarnings("ignore", category=FutureWarning)
# XGate().control(num_ctrl_qubits=3,ctrl_state='000')
#font: Lucida Console

import builtins as __builtin__
import sys

def print(*args, **kwargs):
    new_args = []
    for item in args:
        if type(item) == np.ndarray and item.dtype == np.dtype('bool'):
            new_args.append(item.astype(int))
        else:
            new_args.append(item)
    new_args = tuple(new_args)
    
    return __builtin__.print(*new_args, **kwargs)

def measure(qc, shots=1000):
    aer_sim = Aer.get_backend('aer_simulator')
    transpiled = transpile(qc, aer_sim)
    qobj = assemble(transpiled)
    results = aer_sim.run(qobj, shots=shots).result()
    counts = results.get_counts()
    return counts

# ===========================================================

def isCommute(row_1, row_2):
    n_qubit = len(row_1) // 2
    
    answer = True
    for i in range(n_qubit):
        answer ^= row_1[i] & row_2[n_qubit + i]
        answer ^= row_2[i] & row_1[n_qubit + i]

    return answer

def rowSum(row_1, row_2):
    """
    Calculate tableau(Pauli(row_1) * Pauli(row_2)).
    """
    n_qubit = len(row_1) // 2

    X = [True, False]
    Y = [True, True]
    Z = [False, True]

    new_row = np.array([False] * (2 * n_qubit + 1))

    phase_shift = 0
    if row_1[2 * n_qubit] == True:
        phase_shift += 2
    if row_2[2 * n_qubit] == True:
        phase_shift += 2
    for i in range(n_qubit):
        new_row[i] = row_1[i] ^ row_2[i]
        new_row[n_qubit + i] = row_1[n_qubit + i] ^ row_2[n_qubit + i]
        if [row_1[i], row_1[n_qubit + i], row_2[i], row_2[n_qubit + i]] in [ X+Y, Y+Z, Z+X ]:
            phase_shift += 1
        elif [row_1[i], row_1[n_qubit + i], row_2[i], row_2[n_qubit + i]] in [ X+Z, Z+Y, Y+X ]:
            phase_shift -= 1  
        print("i = %d, phase_shift = %d" % (i, phase_shift))
    assert(phase_shift % 2 == 0)
    
    phase_shift = phase_shift % 4
    print("phase_shift = %d" % phase_shift)
    if phase_shift == 2:
        new_row[n_qubit * 2] = True

    return new_row
        
    
def observableToTableau(observable):
    n_qubit = len(observable)

    row = np.array([False] * (2 * n_qubit + 1))
    for i in range(n_qubit):
        if observable[i] == 'X' or observable[i] == 'Y':
            row[i] = True
        if observable[i] == 'Z' or observable[i] == 'Y':
            row[n_qubit + i] = True

    return row



def measureClifford(observable, is_setup, is_reset):
    """
    Example: Observable IX001YYZ means
             the probability of --001-- times
             the expectation of IX---YYX under --001--.
    """
    global tableau
    global tableau_setup
    global tableau_tmp

    if is_reset:
        tableau_setup = tableau.copy()
        return
    tableau_tmp = tableau_setup.copy()
        
    n_qubit = len(tableau) // 2
    observable = list(observable)
    is_zero = False
    is_negative = False
    value = 0

    # step 0: transform to Z basis
    print("observable = %s" % observable)
    # print("Transform to Z basis")
    for jth_row in range(n_qubit * 2):
        for ith_qubit in range(n_qubit):
            if observable[ith_qubit] in ['i', 'j', 'Y']: # apply Sdg
                tableau_tmp[jth_row][ith_qubit + n_qubit] ^= tableau_tmp[jth_row][ith_qubit] 
                tableau_tmp[jth_row][2 * n_qubit] ^= tableau_tmp[jth_row][ith_qubit] & tableau_tmp[jth_row][ith_qubit + n_qubit]
            if observable[ith_qubit] in ['+', '-', 'X', 'i', 'j', 'Y']: # apply H
                tableau_tmp[jth_row][2 * n_qubit] ^= tableau_tmp[jth_row][ith_qubit] & tableau_tmp[jth_row][ith_qubit + n_qubit]
                (tableau_tmp[jth_row][ith_qubit], tableau_tmp[jth_row][ith_qubit + n_qubit]) = (tableau_tmp[jth_row][ith_qubit + n_qubit], tableau_tmp[jth_row][ith_qubit]) 
            # print("jth_row = %d, ith_qubit = %d" % (jth_row, ith_qubit))
            # print(tableau_tmp)
            # print()
    print("Transform to Z basis middle")
    for ith_qubit in range(n_qubit):
        if observable[ith_qubit] in ['X', 'Y']:
            observable[ith_qubit] = 'Z'
        elif observable[ith_qubit] in ['+', 'i']:
            observable[ith_qubit] = '0'
        elif observable[ith_qubit] in ['-', 'j']:
            observable[ith_qubit] = '1'

    # step 1: handle probability calculation
    for ith_qubit in range(len(observable)):
        if observable[ith_qubit] in ['0', '1']: # do Z-basis measurement
            has_anticommute = False
            first_anticommute_row_idx = None
            first_anticommute_row = np.array([False] * (2 * n_qubit + 1))
            print("ith_qubit = %d, first_anticommute_row_idx = %d" % (ith_qubit, first_anticommute_row_idx if first_anticommute_row_idx != None else -1))
            print("first_anticommute_row = %s" % first_anticommute_row)
            print("has_anticommute = %s" % has_anticommute)
            print("tableau_tmp")
            print(tableau_tmp)
            print()
            for jth_row in range(n_qubit, n_qubit * 2):
                if tableau_tmp[jth_row][ith_qubit] == True:
                    print("jth_row = %d" % jth_row)
                    print("tableau_tmp[jth_row] = %s" % tableau_tmp[jth_row])
                    print("first_anticommute_row = %s" % first_anticommute_row)
                    tableau_tmp[jth_row] = rowSum(first_anticommute_row, tableau_tmp[jth_row])
                    print("tableau_tmp[jth_row] = %s" % tableau_tmp[jth_row])
                    print()
                    if has_anticommute == False:
                        first_anticommute_row = tableau_tmp[jth_row].copy()
                        first_anticommute_row_idx = jth_row
                    has_anticommute = True
            print("ith_qubit = %d, first_anticommute_row_idx = %d" % (ith_qubit, first_anticommute_row_idx))
            print("first_anticommute_row = %s" % first_anticommute_row)
            print("has_anticommute = %s" % has_anticommute)
            print("tableau_tmp")
            print(tableau_tmp)
            print()
            if has_anticommute: # case 1: 50%-50%
                value += 1
                
                for jth_row in range(n_qubit):
                    if jth_row == first_anticommute_row_idx - n_qubit:
                        continue    ## not mentioned in paper
                    if tableau_tmp[jth_row][ith_qubit] == True:
                        tableau_tmp[jth_row] = rowSum(first_anticommute_row, tableau_tmp[jth_row])
                
                tableau_tmp[first_anticommute_row_idx - n_qubit]            = tableau_tmp[first_anticommute_row_idx].copy()
                tableau_tmp[first_anticommute_row_idx]                      = np.array([False] * (2 * n_qubit + 1))
                tableau_tmp[first_anticommute_row_idx][ith_qubit + n_qubit] = True
                tableau_tmp[first_anticommute_row_idx][n_qubit * 2]         = (observable[ith_qubit] == '1') # collapse
                
            else:               # case 2: deterministic
                is_taken = [False] * n_qubit
                for jth_row in range(n_qubit):
                    if tableau_tmp[jth_row][ith_qubit] == True:
                        is_taken[jth_row] = True
                
                ancilla_row = np.array([False] * (2 * n_qubit + 1))
                for jth_row in range(n_qubit):
                    if is_taken[jth_row] == True:
                        ancilla_row = rowSum(tableau_tmp[jth_row + n_qubit], ancilla_row)

                if ancilla_row[n_qubit * 2] != (observable[ith_qubit] == '1'):
                    is_zero = True
                    if is_setup:
                        tableau_setup = tableau_tmp.copy()
                    print("measurement result never happens")
                    print(tableau_tmp)
                    return (is_zero, is_negative, value) # such measurement result never happens
                
                # otherwise, such measurement result always happens
            observable[ith_qubit] = 'I'
        
    # step 2: handle expectation value calculation
    observable_row = observableToTableau(observable)
    
    for jth_row in range(n_qubit, n_qubit * 2):
        if isCommute(observable_row, tableau_tmp[jth_row]) == False:
            is_zero = True
            if is_setup:
                tableau_setup = tableau_tmp.copy()
            print("expectation value must be 0")
            print(tableau_tmp)
            return (is_zero, is_negative, value)    # expectation value must be 0; no need to futher update the tableau 
    
    is_taken = [False] * n_qubit
    for jth_row in range(n_qubit):
        if isCommute(observable_row, tableau_tmp[jth_row]) == False:
            is_taken[jth_row] = True
    
    ancilla_row = np.array([False] * (2 * n_qubit + 1))
    for jth_row in range(n_qubit):
        if is_taken[jth_row] == True:
            ancilla_row = rowSum(tableau_tmp[jth_row + n_qubit], ancilla_row)
            
    if ancilla_row[n_qubit * 2] == True:
        is_negative = not is_negative

    if is_setup:
        tableau_setup = tableau_tmp.copy()
    print("Final")
    print(tableau_tmp)
    return (is_zero, is_negative, value)


# /////////////////////////////

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
    wfile.write('OPENQASM 2.0;\ninclude "qelib1.inc";\nqreg q[%d];\n' % (n_qubits + n_ancilla))
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

    return (n_qubits + n_ancilla, t_gates, ccx_gates, clifford_observables, tableau)

#qc = importQasm(r"C:\Users\TianFu\Desktop\random_t1_n10_id0.qasm")
(n_qubits_new, t_gates, ccx_gates, clifford_observables, tableau) = parseBlif(r"random_t1_n10_id0.qasm", "test_out.qasm")
#stab = StabilizerState(qc)
#tableau = stab.clifford.tableau
measureClifford(observable=None, is_setup=None, is_reset=True)
measureClifford(observable=list('000000000I0I'), is_setup=True, is_reset=False)
measureClifford(observable=list('IIIIIIIIIXIj'), is_setup=False, is_reset=False)
0/0



# =============================================================

if True:
    w = (1+1j)/(2**0.5)
    table = dict()
    for init in ['0', '1', '+', '-', 'i', 'j']:
        table[init] = {'I': 1}
        for obs in ['0', '1', '+', '-', 'i', 'j', 'X', 'Y', 'Z']:
            qc = QuantumCircuit(1)
            if init in ['1', '-', 'j']:
                qc.x(0)
            if init in ['+', '-', 'i', 'j']:
                qc.h(0)
            if init in ['i', 'j']:
                qc.s(0)

            qc.t(0)
            
            if obs in ['i', 'j', 'Y']:
                qc.sdg(0)
            if obs in ['+', '-', 'i', 'j', 'X', 'Y']:
                qc.h(0)

            sv = Statevector(qc)

            if obs in ['0', '+', 'i']:
                table[init][obs] = abs(sv[0])**2
            elif obs in ['1', '-', 'j']:
                table[init][obs] = abs(sv[1])**2
            elif obs in ['X', 'Y', 'Z']:
                table[init][obs] = abs(sv[0])**2 - abs(sv[1])**2

# =============================================================

from qiskit.quantum_info import Pauli
import cmath

qc = QuantumCircuit(3)
qc.h(0)
qc.t(0)
qc.h(0)
qc.cx(0, 1)
qc.h(2)
qc.cx(2, 1)
qc.t(1)
#qc.draw('mpl').show()

# Qiskit method
golden = dict()
state = Statevector(qc)
tmp = {'0': ['0'], '1': ['1'], 'I': ['0','1']}
for ob_1 in ['0', '1', 'I']:
    for ob_2 in ['0', '1', 'I']:
        for ob_3 in ['0', '1', 'I']:
            result = 0
            for i1 in tmp[ob_1]:
                for i2 in tmp[ob_2]:
                    for i3 in tmp[ob_3]:
                        op = int(i3+i2+i1, 2)
                        result += abs(state[op])**2
            golden[ob_1+ob_2+ob_3] = result
            print(ob_1+ob_2+ob_3, result)
print()

# Our method
qc = QuantumCircuit(5)
qc.h(0)
qc.x(3)     
qc.h(3)
qc.cx(3, 4)
qc.x(4)     
qc.h(3)
qc.cx(3, 1)
qc.h(2)
qc.cx(2, 1)
#qc.draw('mpl').show()
stab = StabilizerState(qc)
tableau = stab.clifford.tableau


measureClifford(observable=None, is_setup=False, is_reset=True)
measureClifford(observable=None, is_setup=False, is_reset=True)
(is_zero, is_negative, value) = measureClifford(observable=['0', '0', '0', 'I', 'I'], is_setup=True, is_reset=False)
(is_zero, is_negative, value) = measureClifford(observable=['I', 'I', 'I', 'X', '0'], is_setup=False, is_reset=False)
print()
measureClifford(observable=None, is_setup=False, is_reset=True)
(is_zero, is_negative, value) = measureClifford(observable=['0', '0', '0', 'X', '0'], is_setup=False, is_reset=False)
0/0


for ob_1 in ['0', '1', 'I']:
    for ob_2 in ['0', '1', 'I']:
        for ob_3 in ['0', '1', 'I']:
            start_time = time.time()
            
            result = 0
            exponent = 3 # initially 3 since there are 3 cuts
            measureClifford(observable=None, is_setup=False, is_reset=True)

            observable = ['I', 'I', ob_3, ob_1, 'I'] # Note here
            (is_zero, is_negative, value) = measureClifford(observable=observable, is_setup=True, is_reset=False)
            exponent += value
            
            for cut_1 in range(8):
                for cut_2 in range(8):
                    for cut_3 in range(8):
                        observable = ['IIXXYYZZ'[cut_1],
                                      'IIXXYYZZ'[cut_3],
                                      'I', # Note here
                                      'I', # Note here
                                      '10-+ji10'[cut_2] ]

                        (is_zero, is_negative, value) = clifford_value = measureClifford(observable=observable, is_setup=False, is_reset=False)
                        clifford_value = 0.5**value
                        if is_zero:
                            clifford_value = 0
                        elif is_negative:
                            clifford_value *= -1
                            
                        t1_value = table['01+-ij01'[cut_1]]['IIXXYYZZ'[cut_2]]
                        t2_value = table['01+-ij01'[cut_3]][ob_2]

                        coef = 1 # Note here
                        if cut_1 in [3,5,7]:
                            coef *= -1
                        if cut_2 in [3,5,7]:
                            coef *= -1
                        if cut_3 in [3,5,7]:
                            coef *= -1

                        result += (coef * clifford_value * t1_value * t2_value) * 2

            end_time = time.time()
            print(ob_1+ob_2+ob_3, result, exponent, end_time - start_time)
            assert(cmath.isclose( (golden[ob_1+ob_2+ob_3]), (result*(0.5**exponent)), abs_tol=1e-5))
                
