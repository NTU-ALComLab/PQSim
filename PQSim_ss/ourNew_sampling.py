import time
import signal
import subprocess 
import sys

def handler(signum, frame):
    raise Exception("TO")
signal.signal(signal.SIGALRM, handler)

def runCommand(command, show_console=False):
    command = command.split()
    try:
        process = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    except FileNotFoundError:
        raise Exception("FileNotFoundError. Maybe '%s' is not a command or executable" % command[0])
    (output, error_message) = process.communicate()
    
    if process.returncode == 124:
        return "TO"
        
    if process.returncode != 0:
        raise Exception("exit code = " + str(process.returncode) + " with error message as follows\n\n" + error_message.decode())

    return output.decode("big5")


core = int(sys.argv[1])
path = sys.argv[2]
print(core, path, flush=True) 


observable_map_path = './observable_map_core_%d.txt' % core
   
try:
    command_1 = 'python ../our_new/translator.py %s %s' % (path, observable_map_path)
    result = runCommand(command_1)
    if result.strip(' \n\r\t').endswith('Killed'):
        print("MO", "MO", flush=True)
        exit()
    result = result.strip('\n\r ').split('\n')
    n_origin = int(result[0])
    n_after  = int(result[1])
    n_cuts   = int(result[2])
    
    
    start_time = time.time()
    signal.alarm(86400)
    
    command_2 = 'timeout 86410 taskset -c %d ../our_new/build/simulator sample 1000 %d %d %d %s' % (core, n_origin, n_after, n_cuts, observable_map_path)
    result = runCommand(command_2)
    if result.strip(' \n\r\t').endswith('Killed'):
        print("MO", "MO", flush=True)
        exit()
    
    end_time = time.time()
    signal.alarm(0)

    result = result.strip('\r\n').replace('\r', '').replace('\n', ';;;')
    print(result, end_time - start_time, flush=True)
    
except Exception as e:
  if "TO"==str(e):
      print("TO", "TO", flush=True)
      time.sleep(10)
  else:
      raise e
