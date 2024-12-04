input = []

with open('./input.txt') as f:
    for line in f:
        input.append(line.strip())

input = [list(line) for line in input]

occurrences = 0

def checkW(line, xIdx):
    checkIndex = xIdx
    checkedStr = ''
    helper = 0
    while helper < 4:
        if checkIndex >= len(line):
            break
        checkedStr += line[checkIndex]
        checkIndex += 1
        helper += 1
    if checkedStr == 'XMAS':
        return True
    return False

def checkE(line, idx):
    checkIndex = xIdx
    checkedStr = ''
    helper = 0
    while helper < 4:
        if checkIndex < 0:
            break
        checkedStr += line[checkIndex]
        checkIndex -= 1
        helper += 1
    if checkedStr == 'XMAS':
        return True
    return False

def checkN(input, xIndex, yIndex):
    checkedStr = ''
    helper = 0
    while helper < 4:
        if xIndex < 0 or yIndex < 0:
            break
        checkedStr  += input[yIndex][xIndex]
        yIndex -= 1
        helper += 1
    if checkedStr == 'XMAS':
        return True
    return False

def checkS(input, xIndex, yIndex):
    checkedStr = ''
    helper = 0
    while helper < 4:
        if xIndex >= len(input[0]) or yIndex >= len(input):
            break
        checkedStr  += input[yIndex][xIndex]
        yIndex += 1
        helper += 1
    if checkedStr == 'XMAS':
        return True
    return False

def checkNw(input, xIndex, yIndex):
    checkedStr = ''
    helper = 0
    while helper < 4:
        if xIndex >= len(input[0]) or yIndex < 0:
            break
        checkedStr  += input[yIndex][xIndex]
        yIndex -= 1
        xIndex += 1
        helper += 1
    if checkedStr == 'XMAS':
        return True
    return False

def checkNe(input, xIndex, yIndex):
    checkedStr = ''
    helper = 0
    while helper < 4:
        if xIndex < 0 or yIndex < 0:
            break
        checkedStr  += input[yIndex][xIndex]
        yIndex -= 1
        xIndex -= 1
        helper += 1
    if checkedStr == 'XMAS':
        return True
    return False

def checkSe(input, xIndex, yIndex):
    checkedStr = ''
    helper = 0
    while helper < 4:
        if xIndex < 0 or yIndex >= len(input):
            break
        checkedStr  += input[yIndex][xIndex]
        yIndex += 1
        xIndex -= 1
        helper += 1
    if checkedStr == 'XMAS':
        return True
    return False

def checkSw(input, xIndex, yIndex):
    checkedStr = ''
    helper = 0
    while helper < 4:
        if xIndex >= len(input[0]) or yIndex >= len(input):
            break
        checkedStr  += input[yIndex][xIndex]
        yIndex += 1
        xIndex += 1
        helper += 1
    if checkedStr == 'XMAS':
        return True
    return False

for yIdx, line in enumerate(input):
    for xIdx, c in enumerate(line):
        if checkW(line, xIdx):
            occurrences += 1
        if checkE(line, xIdx):
            occurrences += 1
        if checkN(input, xIdx, yIdx):
            occurrences += 1
        if checkS(input, xIdx, yIdx):
            occurrences += 1
        if checkNw(input, xIdx, yIdx):
            occurrences += 1
        if checkSw(input, xIdx, yIdx):
            occurrences += 1
        if checkNe(input, xIdx, yIdx):
            occurrences += 1
        if checkSe(input, xIdx, yIdx):
            occurrences += 1

print(occurrences)