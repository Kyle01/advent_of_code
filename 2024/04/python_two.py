input = []

with open('./input.txt') as f:
    for line in f:
        input.append(line.strip())

input = [list(line) for line in input]
occurrences = 0

for yIdx, line in enumerate(input):
    for xIdx, c in enumerate(line):
        if c != 'A':
            continue
        if xIdx-1 < 0:
            continue
        if xIdx+1 >= len(line):
            continue
        if yIdx-1 < 0:
            continue
        if yIdx+1 >= len(line):
            continue

        checkWordLeft = input[yIdx-1][xIdx-1] + input[yIdx+1][xIdx+1]
        checkWordRight = input[yIdx-1][xIdx+1] + input[yIdx+1][xIdx-1]
        checkWordLeft = "".join(sorted(checkWordLeft))
        checkWordRight = "".join(sorted(checkWordRight))
        if checkWordLeft == 'MS' and checkWordRight == 'MS':
            occurrences += 1

print(occurrences)