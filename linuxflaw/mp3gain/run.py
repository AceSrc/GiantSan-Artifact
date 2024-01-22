import subprocess
import os

def execute(command):
    rt = subprocess.call(command, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    return rt

path = os.path.dirname(os.path.abspath(__file__))

for cve in os.listdir(path):
    if not cve.startswith('CVE-'): continue
    print("testing {}: ".format(cve), end='')
    cvedir = os.path.join(path, cve) 
    for testcase in os.listdir(cvedir):
        if testcase == 'README.md': continue
        testcase_dir = os.path.join(cvedir, testcase)
        command = './mp3gain-1.5.2/mp3gain -f {}'.format(testcase_dir)
        if execute(command) == 0:
            print("\033[0;31mFailed\033[0m")
        else:
            print("\033[0;32mPassed\033[0m")


