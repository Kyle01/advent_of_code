import copy

input = []

with open('./input.txt') as f:
    for line in f:
        input.append(line.strip())

def is_safe(numbers):
    k = 1 
    while k < len(numbers):
        if numbers[k] - numbers[k-1] < 1 or numbers[k] - numbers[k-1] > 3:
            return False
        k += 1
    
    return True

def test_line(line):
    numbers = [int(x) for x in line.split(' ')]

    if is_safe(numbers):
        return True
    numbers.reverse()
    if is_safe(numbers):
        return True
    
    k = 0
    while k < len(numbers):
        copy_arr = copy.deepcopy(numbers)
        copy_arr.pop(k)
        if is_safe(copy_arr):
            return True
        copy_arr.reverse()
        if is_safe(copy_arr):
            return True
        k += 1
        
    return False 

answers = 0
for line in input:
    print(line)
    if test_line(line):
        answers += 1

print(answers)
