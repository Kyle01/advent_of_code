from itertools import combinations

input = []

with open('./input.txt') as f:
    for line in f:
        input.append(line.strip())

print(len(input))

def possible_keys(len):
    symbols = ['+', '*']
    helper = []
    for x in range(len):
        helper.append(symbols[0])
        helper.append(symbols[1])
    
    return list(combinations(helper, len))

output = 0
for l, line in enumerate(input):
    print(l)
    split_nums = line.split(': ')
    solution = int(split_nums[0])
    numbers = [int(x) for x in split_nums[1].split(' ')]
    symbols = possible_keys(len(numbers)-1)

    for chance in symbols: 
        attempt = numbers[0]
        for x, sym in enumerate(chance):
            if sym == '+':
                attempt += numbers[x+1]
            else:
                attempt *= numbers[x+1]
        if attempt == solution:
            output += attempt
            break

print(output)
