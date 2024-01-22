import os

files = []
for f in os.listdir('.'):
    if f.endswith('.out'):
        files.append(f)
    

for f in files:
    rt = os.system(' '.join(['timeout', '1', './' + f, '> {}'.format(f + ".log"), '2> {}'.format(f + ".err")]))
    print("{}: {}".format(f, rt))