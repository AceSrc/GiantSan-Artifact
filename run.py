import subprocess
import os

def execute(command):
    os.system(command)
    
print("Compiler Information:", flush=True)
execute('clang++ -v')
path = os.path.dirname(os.path.abspath(__file__))
os.chdir(path)
execute('python3 juliet/run.py')
execute('python3 linuxflaw/run.py')
execute('python3 magma/run.py -c')
