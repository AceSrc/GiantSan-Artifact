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
        if cve == 'CVE-2016-10270':
            command = './tiff-4.0.7/tools/tiffcp -i ./CVE-2016-10270/00074-libtiff-heapoverflow-TIFFFillStrip /tmp/foo'
        elif cve == 'CVE-2016-10271':
            command = './tiff-4.0.7/tools/tiffcrop -i ./CVE-2016-10271/00100-libtiff-heapoverflow-_TIFFFax3fillruns /tmp/foo'
        elif cve == 'CVE-2016-10095':
            command = './tiff-4.0.7/tools/tiffsplit ./CVE-2016-10095/00104-libtiff-stackoverflow-_TIFFVGetField /tmp/foo'

        if execute(command) == 0:
            print("\033[0;31mFailed\033[0m")
        else:
            print("\033[0;32mPassed\033[0m")


