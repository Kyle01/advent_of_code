lines = []
with open('./input.txt') as f:
    for line in f:
        lines.append(line.strip())

def manhattan_distance(point):
    return abs(point[0]) + abs(point[1])

def str_point(point):
    return f"[{','.join([str(x) for x in point])}]"

def line_path(str):
    path = {}
    current_location = [0,0]
    steps = 0
    instructions = str.split(',')
    for instruction in instructions:
        direction = instruction[0]
        distance = int(instruction[1:])
        for x in range(0, distance):
            match direction:
                case 'L':
                    steps += 1
                    current_location = [current_location[0]-1, current_location[1]]
                case 'R':
                    steps += 1
                    current_location = [current_location[0]+1, current_location[1]]
                case 'U':
                    steps += 1
                    current_location = [current_location[0], current_location[1]-1]
                case 'D':
                    steps += 1
                    current_location = [current_location[0], current_location[1]+1]

            str_path = str_point(current_location)
            path[str_path] = steps
    
    return path

def find_distances(dict_one, dict_two):
    distances = []
    for point in dict_one.keys():
        if point in  dict_two:
            distances.append(dict_one[point] + dict_two[point])
    
    return distances

line_paths = [line_path(l) for l in lines]
distances = find_distances(line_paths[0], line_paths[1])
max_distance = min(distances)


print(max_distance)