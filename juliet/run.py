import os
import sys
import subprocess

tmpcwd = os.getcwd()
path = os.path.dirname(os.path.abspath(__file__))
os.chdir(path)

root_dir = './testcases/'

p = open('test_result.data', 'w')

def execute(command):
    rt = subprocess.call(command, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    return rt

def run(working_dir):
    alarm = 0
    tot = 0
    for executable in os.listdir(working_dir):
        if not executable.endswith('.out'):
            continue
        if executable.find('rand') != -1:
            continue
        if executable.find('socket') != -1:
            continue
        if executable.find('CWE135') != -1: 
            continue
        tot += 1
        target = os.path.join(working_dir, executable)
        command = 'GlobalTrue=1 timeout 0.2 {} > {}.log > {}.err'.format(target, target, target)
        rt = execute(command)
        #rt = os.system(command)
        if rt == 0:
            command = 'GlobalFalse=1 timeout 0.2 {} > {}.log > {}.err'.format(target, target, target)
            rt = execute(command)
            #rt = os.system(command)
        if rt == 0:
            p.write('{}: noalarm\n'.format(executable))
        elif rt == 31744:
            p.write('{}: timeout\n'.format(executable))
        else:
            p.write('{}: alarm\n'.format(executable))
            alarm += 1
    return (tot, alarm) 

def work(f):
    benchmark_dir = root_dir + f
    tot = 0
    rt = 0
    for f in os.listdir(benchmark_dir):
        working_dir = os.path.join(benchmark_dir, f)
        if not f.startswith('s'):
            working_dir = benchmark_dir
            command = 'make -C {} clean -j32'.format(working_dir)
            execute(command)
            command = 'make -C {} individuals -j32'.format(working_dir)
            execute(command)
            result = run(working_dir)
            tot += result[0]
            rt += result[1]
            break
        command = 'make -C {} individuals -j32'.format(working_dir)
        execute(command)
        result = run(working_dir)
        tot += result[0]
        rt += result[1]
    return (tot, rt)
print("============= Juliet Test Start =============", flush=True)
with open('benchmark_config', 'r') as fd:
    for f in fd:
        T = f.strip()
        print("working on {}".format(T), flush=True)
        result = work(T)
        print("     \033[0;32m{}\033[0m cases detected".format(result[1]), flush=True)
print("============= Juliet Test End =============", flush=True)
p.close()

os.chdir(tmpcwd)
