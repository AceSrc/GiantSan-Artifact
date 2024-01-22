import argparse
import os
import subprocess
def execute(command):
    rt = subprocess.call(command, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    return rt

parser = argparse.ArgumentParser(description='Command Line Helper')
parser.add_argument('-c', '--compile', action='store_true', help='recompile the project')
args = parser.parse_args()

path = os.path.dirname(os.path.abspath(__file__))
root = os.path.join(path, 'exif_poc')
cnt16 = 0
cnt512 = 0

progress = 0
total = 0
for f in os.listdir(root): total += 1

print("============= MAGMA(PHP) Test Start =============", flush=True)
if args.compile:
    print("Recompiling the project", flush=True)
    tmpdir = os.getcwd()
    os.chdir(path)
    execute('./build.sh')
    os.chdir(tmpdir)
    print("Compilation End", flush=True)

for f in os.listdir(root):
    poc = os.path.join(root, f)
    command = '{}/repo/sapi/fuzzer/php-fuzz-exif {}'.format(path, poc)
    NewCommand = 'ASAN_OPTIONS=redzone=16 ' + command
    if execute(NewCommand) != 0: cnt16 += 1;
    NewCommand = 'ASAN_OPTIONS=redzone=512 ' + command
    if execute(NewCommand) != 0: cnt512 += 1;
    progress += 1    
    if progress % 20 == 0:
        print('-- Progress {}% --'.format(round(100 * progress / total, 2)), flush=True)

print("REDZONE= 16: \033[0;31m{}\033[0m testcases detected".format(cnt16), flush=True)
print("REDZONE=512: \033[0;31m{}\033[0m testcases detected".format(cnt512), flush=True)
print("============= MAGMA(PHP) Test End =============", flush=True)
