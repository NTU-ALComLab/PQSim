import json









from qiskit import *
from qiskit.quantum_info import Statevector, DensityMatrix, partial_trace, random_statevector
import time
import random
import numpy as np
import warnings
import builtins as __builtin__
import sys
warnings.filterwarnings("ignore", category=DeprecationWarning)
warnings.filterwarnings("ignore", category=FutureWarning)
random.seed(0)
# XGate().control(num_ctrl_qubits=3,ctrl_state='000')
#font: Lucida Console

def print(*args, **kwargs): # overwrite print Boolean matrices
    new_args = []
    for item in args:
        if type(item) == np.ndarray and item.dtype == np.dtype('bool'):
            new_args.append(item.astype(int))
        else:
            new_args.append(item)
    new_args = tuple(new_args)
    
    return __builtin__.print(*new_args, **kwargs)

def show_m(m, thres=0.005):
    data = ''
    for i in range(len(m)):
        for j in range(len(m[i])):
            if abs(m[i,j].real) > thres:
                real = '%.4f' % m[i,j].real
            else:
                real = '0'

            mid = ' + '
            if abs(m[i,j].imag) > thres:
                imag = '%.4f' % abs(m[i,j].imag)
                if m[i,j].imag<0:
                    mid = ' - '
            else:
                imag = '0'

            data += real.rjust(7) + mid + imag.ljust(8) + ' '
        data += '\n'
    print(data)

def readBlif(filename):
    operations = []
    with open(filename) as file:
        data = file.read().replace(",", "").strip('\n').split('\n')
        for line in data:
            line = line.strip('; ')
            if line == '':
                continue
            line = line.split(' ')
            if line[0] in ['OPENQASM', 'include', 'qreg', 'creg', 'measure']:
                continue

            qubits = []
            for item in line[1:]:
                qubits.append(int(item[ item.index('q[')+2 : item.index(']') ]))
            operations.append( (line[0],qubits) )
            
    return operations

def applyGate(qc, operation):
    (gate, qubits) = operation
    single_qubit_mapping = {'h': qc.h, 's': qc.s, 't': qc.t,
                            'x': qc.x, 'y': qc.y, 'z': qc.z,
                            'sdg': qc.sdg, 'tdg': qc.tdg }
    two_qubit_mapping = {'cx': qc.cx, 'cz': qc.cz, 'swap': qc.swap}
    
    if gate in single_qubit_mapping:
        single_qubit_mapping[gate](qubits[0])
    elif gate in two_qubit_mapping:
        two_qubit_mapping[gate](qubits[0], qubits[1])
    elif gate=='rx(pi/2)':
        qc.rx(np.pi/2, qubits[0])
    elif gate=='ry(pi/2)':
        qc.ry(np.pi/2, qubits[0])
    elif gate=='rx(-pi/2)':
        qc.rx(-np.pi/2, qubits[0])
    elif gate=='ry(-pi/2)':
        qc.ry(-np.pi/2, qubits[0])
    elif gate=='mcx' or gate=='ccx':
        if len(qubits)==1:
            qc.x(qubits[0])
        else:
            qc.mcx(qubits[:-1], qubits[-1])
    elif gate=='cswap':
        qc.cswap(qubits[0], qubits[1], qubits[2])
    else:
        raise Exception("%s is not supported" % gate)
    return qc


# if 1:
filename = 'test_out.qasm'
ops = readBlif(filename)
qc = QuantumCircuit(6)
for op in ops:
    qc = applyGate(qc, op)
golden = [abs(x)**2 for x in Statevector(qc)]
    
# else:
#     with open('benchmark_new2/dist.json') as file:
#         golden = json.loads(file.read())['random_t1_n10_id0.qasm']

#save the golden distribution
with open('golden.json', 'w') as file:
    file.write(json.dumps(golden))
    
with open('profile.json') as file:
    # data = file.read().split('\n')
    dist = json.loads(file.read())
    # for line in data:
        # #print(line[:50])
        # if line.startswith('random_t1 10 0'):
        #     print(line.split(' ')[-1])
        #     tmp = line.split(' ')[3:-1]
        #     tmp = ' '.join(tmp)
        #     if tmp == 'TO':
        #         print('TO')
        #     else:
        #         dist = eval(tmp)
        #         #print(len(dist))
    summ = 0
    for item in dist:
        #assert(len(item) == 10)
        key = int(item.replace(' ', '').replace('(', '').replace(')', '').replace(',', '')[::-1], 2)
        p1 = golden[key]
        p2 = dist[item]
        print(''.join(map(str,item)), key, p1, p2)
        summ += (p1*p2)**0.5
    print(summ)
                