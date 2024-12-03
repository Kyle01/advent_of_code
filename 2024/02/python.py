input = []
with open('./input.txt') as f:
    for line in f:
        input.append(line.strip())


def is_safe(line):
    numbers = [int(x) for x in line.split(' ')]
    
    if (numbers[0] > numbers[1]):
        numbers.reverse()
    
    k = 1 
    while k < len(numbers):
        if (numbers[k] - numbers[k-1] < 1 or numbers[k] - numbers[k-1] > 3):
            return False
        k += 1
    
    return True

answers = 0
for line in input:
    if is_safe(line):
        answers += 1

print(answers)
