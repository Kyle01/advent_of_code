import re

with open('input.txt', 'r') as file:
    line = file.readline().strip()
matches = re.findall(r"(?:mul|do|don't)\(\d{0,3}(?:,\d{1,3})?\)", line)
answer = 0
enabled = True
for match in  matches:
    if match == 'do()':
        enabled = True
    elif match == "don't()":
        enabled = False
    else:
        if not enabled:
            continue
        else:
            match = match[:-1]
            match = match[4:]
            numbers = [int(x) for x in match.split(',')]
            answer += numbers[0] * numbers[1]

print(answer)