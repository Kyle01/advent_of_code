input = []

with open('./input.txt') as f:
    for line in f:
        input.append(line.strip())

empty_location = input.index('')
rules = input[0:empty_location]
tests = input[empty_location+1:]

solution = 0
for line in tests:
    numbers = [int(x) for x in line.split(',')]
    line_valid = True
    was_ever_false = False

    k = 0
    while k < len(rules) - 1:
        rule_nums = [int(x) for x in rules[k].split('|')]
        first_num = rule_nums[0]
        second_num = rule_nums[1]

        second_seen = False
        for num in numbers:
            if second_num == num:
                second_seen = True
            if second_seen and first_num == num:
                was_ever_false = True
                line_valid = False

        if not line_valid:
            a, b = numbers.index(first_num), numbers.index(second_num)
            numbers[b], numbers[a] = numbers[a], numbers[b]
            line_valid = True
            second_seen = False
            k = 0
            continue
        k += 1
    
    if was_ever_false:
        middle_index = int((len(numbers) - 1)/2)
        solution += numbers[middle_index]

print(solution)