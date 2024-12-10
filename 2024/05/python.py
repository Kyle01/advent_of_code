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

    for rule in rules:
        rule_nums = [int(x) for x in rule.split('|')]
        first_num = rule_nums[0]
        second_num = rule_nums[1]

        second_seen = False
        for num in numbers:
            if second_num == num:
                second_seen = True
            if second_seen and first_num == num:
                line_valid = False

    # print(f"{line} ; {line_valid}")
    if line_valid:
        middle_index = int((len(numbers) - 1)/2)
        solution += numbers[middle_index]

print(solution)