import time
import os

# conda activate quantum

core = 10

if True:
    # scalability
    for t in range(1, 11):
        path = "../benchmark_scalability/random_t%d_n40_id0.qasm" % (t)
        command = "nohup python our_query.py %d %s > scalability_our_%d.out 2> scalability_our_%d.err &" % (core, path, t, t)
        print(command)
        #os.system(command)
        core += 1
        #time.sleep(60) 
    
    # weak 
    for circuit in ['random_t3', 'simon', 'dj_const', 'dj_bal']:
        for n in [30, 40]:
            path = "../benchmark_new2/%s_n%d_id0.qasm" % (circuit, n)
            command = "nohup python TC_sampling.py %d %s > weak_TC_%s_n%d.out 2> weak_TC_%s_n%d.err &" % (core, path, circuit, n, circuit, n)
            print(command)
            #os.system(command)
            core += 1
            #time.sleep(60)
            
            command = "nohup python SliQ_sampling.py %d %s > weak_SliQ_%s_n%d.out 2> weak_SliQ_%s_n%d.err &" % (core, path, circuit, n, circuit, n)
            print(command)
            #os.system(command)
            core += 1
            #time.sleep(60)
            
            command = "nohup python our_sampling.py %d %s > weak_our_%s_n%d.out 2> weak_our_%s_n%d.err &" % (core, path, circuit, n, circuit, n)
            print(command)
            #os.system(command)
            core += 1
            #time.sleep(60)
            
    print('='*20)

if False:
    # strong
    for circuit in ['random_t3', 'simon', 'dj_const', 'dj_bal']:
        for n in [10, 20, 30]:
            path = "../benchmark_new2/%s_n%d_id0.qasm" % (circuit, n)
            command = "nohup python our_query.py %d %s > strong_our_%s_n%d.out 2> strong_our_%s_n%d.err &" % (core, path, circuit, n, circuit, n)
            print(command)
            #os.system(command)
            core += 1
            #time.sleep(60)
            
if True:
    # trade-off
    path = "../benchmark_new2/simon_n10_id0.qasm"
    for shots in [100, 200, 300, 400, 500, 1000]:
        command = "nohup python ourNew_tradeoff.py %d %s %d > tradeoff_ourNew_%d.out 2> tradeoff_ourNew_%d.err &" % (core, path, shots, shots, shots)
        print(command)
        #os.system(command)
        core += 1
        #time.sleep(60)
    
    
    # scalability
    for t in range(1, 11):
        path = "../benchmark_scalability/random_t%d_n40_id0.qasm" % (t)
        command = "nohup python ourNew_query.py %d %s > scalability_ourNew_%d.out 2> scalability_ourNew_%d.err &" % (core, path, t, t)
        print(command)
        #os.system(command)
        core += 1
        #time.sleep(60)
    
    # weak 
    for circuit in ['random_t3', 'simon', 'dj_const', 'dj_bal']:
        for n in [30, 40]:
            path = "../benchmark_new2/%s_n%d_id0.qasm" % (circuit, n)
            command = "nohup python ourNew_sampling.py %d %s > weak_ourNew_%s_n%d.out 2> weak_ourNew_%s_n%d.err &" % (core, path, circuit, n, circuit, n)
            print(command)
            #os.system(command)
            core += 1
            #time.sleep(60)
                
    # strong
    for circuit in ['random_t3', 'simon', 'dj_const', 'dj_bal']:
        for n in [10, 20, 30]:
            path = "../benchmark_new2/%s_n%d_id0.qasm" % (circuit, n)
            command = "nohup python ourNew_query.py %d %s > strong_ourNew_%s_n%d.out 2> strong_ourNew_%s_n%d.err &" % (core, path, circuit, n, circuit, n)
            print(command)
            #os.system(command)
            core += 1
            #time.sleep(60)
        
        