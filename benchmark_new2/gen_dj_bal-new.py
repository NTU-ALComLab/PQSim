import sys
import random
random.seed(0)

def generate(n, m, filename):
    n_main = n - 1
    n_1 = (n - 1) // 2
    n_2 = (n - 1) - n_1
    
    key_1 = [0, 1]
    key_2 = [0, 1] 
    for i in range(n_1 - 2):
        key_1.append(int(random.random() < 0.5))
    for i in range(n_2 - 2):
        key_2.append(int(random.random() < 0.5))
    random.shuffle(key_1)
    random.shuffle(key_2)
    m -= ( (n_main + 2) + (n_1 - 1) + (n_2 - 1) + (1) + (n_1 - 1) + (n_2 - 1) + (key_1.count(1)) + (key_2.count(1)) + (n_main) )  # preserved
    assert(m > 0)
    
    random_rev = []
    for i in range(m // 2):
        gate_type = random.choice(['x', 'cx'])
        qubits = random.sample(range(n_main), k = 2)
        random_rev.append((gate_type, qubits))

    with open(filename, 'w') as file:
        file.write('OPENQASM 2.0;\n')
        file.write('include "qelib1.inc";\n')
        file.write('qreg q[%d];\n' % (n))
        file.write('creg c[%d];\n' % (n - 1))

        for i in range(n_main):
            file.write('h q[%d];\n' % i)
        file.write('x q[%d];\n' % (n - 1))
        file.write('h q[%d];\n' % (n - 1))

        for gate_type, qubits in random_rev:
            if gate_type in ['h', 's', 'sdg', 'x', 'y', 'z']:
                file.write('%s q[%d];\n' % (gate_type, qubits[0]))    
            else:
                file.write('%s q[%d], q[%d];\n' % (gate_type, qubits[0], qubits[1]))
        
        for i in range(n_1 - 1):
            file.write('cx q[%d], q[%d];\n' % (i, n_1 - 1))
        for i in range(n_2 - 1):
            file.write('cx q[%d], q[%d];\n' % (n_1 + i, n_1 + n_2 - 1))
        file.write('ccx q[%d], q[%d], q[%d];\n' % (n_1 - 1, n_1 + n_2 - 1, n - 1))
        if m % 2 == 0:
            file.write('x q[%d];\n' % (n - 1))
        for i in range(n_1 - 1):
            file.write('cx q[%d], q[%d];\n' % (i, n_1 - 1))
        for i in range(n_2 - 1):
            file.write('cx q[%d], q[%d];\n' % (n_1 + i, n_1 + n_2 - 1))
        for i in range(n_1):
            if key_1[i] == 1:
                file.write('cx q[%d], q[%d];\n' % (i, n - 1))
        for i in range(n_2):
            if key_2[i] == 1:
                file.write('cx q[%d], q[%d];\n' % (n_1 + i, n - 1))

        for gate_type, qubits in random_rev[::-1]:
            if gate_type in ['h', 's', 'sdg', 'x', 'y', 'z']:
                file.write('%s q[%d];\n' % (gate_type, qubits[0]))    
            else:
                file.write('%s q[%d], q[%d];\n' % (gate_type, qubits[0], qubits[1]))
        
        for i in range(n_main):
            file.write('h q[%d];\n' % i)
        #for i in range(n_main): 
        #    file.write('measure q[%d]->c[%d];\n' % (i, i))


if __name__ == '__main__':
    if False:
        for n in [10, 20, 30]:
            m = n * 100
            for i in range(10):
                filename = "dj_bal_n%d_id%d.qasm" % (n, i)
                generate(n, m, filename)
                print(filename)
                
    else: # usage: python gen_dj_bal.py {qubit-num} {gate-number}
        n = int(sys.argv[1])
        m = int(sys.argv[2])
        assert(n >= 3)
        assert(m >= 8*n)

        filename = "dj_bal_n%d_m%d.qasm" % (n, m)
        generate(n, m, filename)
        print(filename)
    
