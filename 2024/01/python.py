import math

input = []

with open('./input.txt') as f:
    for line in f:
        input.append(line.strip())

list_one = []
list_two = []

for line in input:
    el_list = line.split('   ')
    list_one.append(int(el_list[0]))
    list_two.append(int(el_list[1]))

list_one.sort()
list_two.sort()

answer = 0
for el in list_one:
    answer += el * list_two.count(el)

print(answer)