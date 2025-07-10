import sys
import random
random.seed(0)

def generate(n, t, m1, m2, filename):
    with open(filename, 'w') as file:
        file.write('OPENQASM 2.0;\n')
        file.write('include "qelib1.inc";\n')
        file.write('qreg q[%d];\n' % n)
        file.write('creg c[%d];\n' % n)

        for i in range(m1):
            gate_type = random.choice(['h', 's', 'sdg', 'x', 'y', 'z', 'cx', 'cz', 'swap'])
            qubits = random.sample(range(n), k = 2)
            if gate_type in ['h', 's', 'sdg', 'x', 'y', 'z']:
                file.write('%s q[%d];\n' % (gate_type, qubits[0]))
            else:
                file.write('%s q[%d], q[%d];\n' % (gate_type, qubits[0], qubits[1]))

        qubits = random.sample(range(n), k = t)
        for qubit in qubits:
            file.write('t q[%d];\n' % qubit)

        for i in range(m2):
            gate_type = random.choice(['h', 's', 'sdg', 'x', 'y', 'z', 'cx', 'cz', 'swap'])
            qubits = random.sample(range(n), k = 2)
            if gate_type in ['h', 's', 'sdg', 'x', 'y', 'z']:
                file.write('%s q[%d];\n' % (gate_type, qubits[0]))
            else:
                file.write('%s q[%d], q[%d];\n' % (gate_type, qubits[0], qubits[1]))
                
        #for i in range(n): 
        #    file.write('measure q[%d]->c[%d];\n' % (i, i))


if __name__ == '__main__':
    if False:
        for n in [10, 20, 30]:
            for t in [1, 2, 3]:
                for i in range(10):
                    m1 = n * 50 - t
                    m2 = n * 50
                    filename = "random_t%d_n%d_id%d.qasm" % (t, n, i)
                    generate(n, t, m1, m2, filename)
                    print(filename)
                
    else: # usage: python gen_random.py {qubit-num} {t-count} {gate-num-before} {gate-num-after}
        n = int(sys.argv[1])
        t = int(sys.argv[2])
        m1 = int(sys.argv[3])
        m2 = int(sys.argv[4])

        filename = "random_n%d_t%d_m%d_m%d.qasm" % (n, t, m1, m2)
        
        generate(n, t, m1, m2, filename)
        print(filename)
    
