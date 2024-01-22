def load(filename):
    rt = {}
    with open(filename, 'r') as fd:
        for i in fd:
            x = i.split(':')
            rt[x[0].strip()] = x[1].strip()
    return rt


X = load('./test_result.data')
Y = load('../juliet-clang/test_result.data')

for i in X:
    if X[i] == 'noalarm' and Y.get(i, None) == 'alarm':
        print(i)

