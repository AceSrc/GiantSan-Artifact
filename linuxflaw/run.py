import subprocess
import os

def execute(command):
    rt = subprocess.call(command, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    return rt

path = os.path.dirname(os.path.abspath(__file__))

print("============= CVE Test Start =============", flush=True)

for project_name in os.listdir(path):
    if project_name == 'run.py': continue
    project = os.path.join(path, project_name)
    print('working on {}'.format(project), flush=True)
    print('  cleaning', flush=True)
    execute('make -C {} clean'.format(project))
    print('  compiling', flush=True)
    execute('make -C {} compile'.format(project))
    print('  running', flush=True)
    command = 'python3 {}/run.py'.format(project)
    os.system(command)
print("============= CVE Test End =============", flush=True)

