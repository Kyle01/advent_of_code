import re

with open('input.txt', 'r') as file:
    line = file.readline().strip()
matches = re.findall(r"mul\(\d{1,3},\d{1,3}\)", line)

answer = 0
for match in  matches:
    match = match[:-1]
    match = match[4:]
    numbers = [int(x) for x in match.split(',')]
    answer += numbers[0] * numbers[1]

print(answer)