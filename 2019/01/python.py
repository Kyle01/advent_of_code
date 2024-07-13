import math

input = []

with open('./input.txt') as f:
    for line in f:
        input.append(int(line.strip()))

def calculate_num(n):
    return math.floor(n / 3) - 2

total = 0
for num in input:
    while num > 0:
        num = calculate_num(num)
        total += max(0, num)
        
print(total)