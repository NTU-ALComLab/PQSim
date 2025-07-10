import os
import sys
import json

# Load distribution
with open('./benchmark_new2/dist.json','r') as file:
	var = json.load(file)

if (len(sys.argv) != 3):
	print("No circuit and n!!!")
	sys.exit()

circ_name = sys.argv[1].split('/')[-1]
n = int(sys.argv[2])

calBC = True if n == 10 else False

if calBC:
	prob = var[circ_name]
	'''
	for i in range(2**n):
		p = prob[i]
		if (abs(p) >= 1e-6):
			print(bin(i).lstrip('0b').zfill(10),p,sep=' ')
	'''

serial_str = '/dev/ttyUSB0'
mode = "-s"
shots = 1000

if "dj" in circ_name or "simon" in circ_name:
	n_exp = 1
elif "t1" in circ_name:
	n_exp = 1
elif "t2" in circ_name:
	n_exp = 2
else:
	n_exp = 3

n_qubit = n
n_measure = n_qubit

exec = os.popen("./weak_sim %s %s %i %i %i %i"%(serial_str,mode,shots,n_exp,n_qubit,n_measure))
exec_str = exec.read().split('\n')[:-1:]
for s in exec_str:
	print(s)
if calBC:
	prob_s = [0]*(2**n_qubit)
	for s in exec_str:
		if "time" in s:
			continue
		if ":" in s:
			ind,v = s.split(":")
			prob_s[int(ind,2)] = int(v)/shots
	bc = 0
	for i in range(2**n_qubit):
		bc += prob[i]**0.5 * prob_s[i]**0.5
	print("BC : %.6f"%(bc))
print()

target_obs = "ZZIYZZYZYXXYXIYXYIIYZIYZYXZZYIIIZIZYXYIX"
obs = target_obs[0:n_qubit][::-1]
mode = "-q"

exec = os.popen("./weak_sim %s %s %s %i %i"%(serial_str,mode,obs,n_exp,n_qubit))
exec_str = exec.read().split('\n')[:-1:]
for s in exec_str:
	print(s)