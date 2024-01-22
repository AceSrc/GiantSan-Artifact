data = {}
with open('test_result.data', 'r') as fd:
    for i in fd:
        key = i.split('_')[0]
        result = i.split(' ')[-1].strip()
        c = key + result
        data[c] = data.get(c, 0) + 1
for i in data:
    print(i, data[i])