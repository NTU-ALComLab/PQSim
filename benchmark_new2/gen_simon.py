import sys
import random
random.seed(0)

def generate(n_main, n_ancilla, key, m, filename):
    m -= (3 * n_main + key.count('1'))  # preserved
    m1 = random.randint(0, m)
    m2 = m - m1
    
    with open(filename, 'w') as file:
        file.write('OPENQASM 2.0;\n')
        file.write('include "qelib1.inc";\n')
        file.write('qreg q[%d];\n' % (n_main + n_ancilla))
        file.write('creg c[%d];\n' % (n_main))

        for i in range(n_main):
            file.write('h q[%d];\n' % i)
        for i in range(n_main - 1):
            file.write('cx q[%d], q[%d];\n' % (i, n_main + i))
        for i in range(n_main - 1):
            if key[i] == '1':
                file.write('cx q[%d], q[%d];\n' % (n_main - 1, n_main + i))
                m -= 1
                
        for i in range(m1): # random circuit 1
            if random.random() < 0.5:
                qubits = random.sample(range(n_main, n_main + n_ancilla), k = 1)
                file.write('x q[%d];\n' % tuple(qubits))
            else:
                qubits = random.sample(range(n_main, n_main + n_ancilla), k = 2)
                file.write('cx q[%d], q[%d];\n' % tuple(qubits))

        qubits = random.sample(range(n_main, n_main + n_ancilla), k = 3)
        file.write('ccx q[%d], q[%d], q[%d];\n' % tuple(qubits))  # random ccx
                
        for i in range(m2): # random circuit 2
            if random.random() < 0.5:
                qubits = random.sample(range(n_main, n_main + n_ancilla), k = 1)
                file.write('x q[%d];\n' % tuple(qubits))
            else:
                qubits = random.sample(range(n_main, n_main + n_ancilla), k = 2)
                file.write('cx q[%d], q[%d];\n' % tuple(qubits))
            
        for i in range(n_main):
            file.write('h q[%d];\n' % i)
        #for i in range(n_main): 
        #    file.write('measure q[%d]->c[%d];\n' % (i, i))

if __name__ == '__main__':
    if False:
        for n in [10, 20, 30]:
            m = n * 100
            for i in range(10):
                n_main = n // 2
                n_ancilla = n - n_main
                key = ''.join(random.choices(['0', '1'], k = n_main - 1))
                filename = "simon_n%d_id%d.qasm" % (n, i)
                
                generate(n_main, n_ancilla, key, m, filename)
                print(filename, key)
                
    else: # usage: python gen_simon.py {qubit-num} {gate-num}
        n = int(sys.argv[1])
        m = int(sys.argv[2])
        assert(n >= 5)
        assert(m >= n)
        
        n_main = n // 2
        n_ancilla = n - n_main
        key = ''.join(random.choices(['0', '1'], k = n_main - 1))
        if len(key) < 10:
            filename = "simon_n%d_m%d_key%s.qasm" % (n, m, key + '1')
        else:
            filename = "simon_n%d_m%d.qasm" % (n, m)
        
        generate(n_main, n_ancilla, key, m, filename)
        print(filename, key)
    
    
