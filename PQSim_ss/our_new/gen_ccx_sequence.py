from mylib.quantum import *

I = np.matrix([[1,0],[0,1]])
X = np.matrix([[0,1],[1,0]])
Y = np.matrix([[0,-1j],[1j,0]])
Z = np.matrix([[1,0],[0,-1]])
mapping = {'I':I, 'X':X, 'Y':Y, 'Z':Z}

qc = QuantumCircuit(3)
qc.ccx(2,1,0)
CCX = Operator(qc).data

candidates = dict()
for a1 in mapping:
    for a2 in mapping:
        for a3 in mapping:
            candidates[a1+a2+a3] = np.kron(np.kron(mapping[a1],mapping[a2]),mapping[a3])

string_a = ""
string_b = ""
string_c = ""
string_1 = ""
string_2 = ""
string_3 = ""
coef_string = ""

for a1 in 'IZXY':
    for a2 in 'IZXY':
        for a3 in 'IZXY':
            target = CCX * candidates[a1+a2+a3] * CCX
            for candidate in candidates:
                coef = np.trace(target * candidates[candidate])
                if coef != 0:
                    string_a += a1
                    string_b += a2
                    string_c += a3
                    string_1 += candidate[0]
                    string_2 += candidate[1]
                    string_3 += candidate[2]

                    if candidate[0] != 'I':
                        coef *= -1
                    if candidate[1] != 'I':
                        coef *= -1
                    if candidate[2] != 'I':
                        coef *= -1

                    
                    if coef/8/8 == 0.125:
                        coef_string += "{2,0,4}, "
                    elif coef/8/8 == -0.125:
                        coef_string += "{-2,0,4}, "
                    elif coef/8/8 == 0.0625:
                        coef_string += "{1,0,4}, "
                    elif coef/8/8 == -0.0625:
                        coef_string += "{-1,0,4}, "
                    else:
                        print(a1,a2,a3,candidate,coef/8/8)
                        0/0
                

print(string_a)
print(string_b)
print(string_c)
print(string_1)
print(string_2)
print(string_3)
print(coef_string)

for i in range(10):
    print(string_a[i],string_b[i],string_c[i],string_1[i],string_2[i],string_3[i])
