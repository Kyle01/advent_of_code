file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)


length_needed = (input_lines.count - 1) * 7 + 1
current_length = input_lines[0].length

increased_lines = input_lines.map do |line|
    new_line = line
    while new_line.length < length_needed
        new_line += line
    end
    new_line
end

map = []
increased_lines.each do |line|
    map << line
end

first_path = 0 # x = 1 y = 1 
second_path = 0 # x = 3 y = 1 
third_path = 0 # x = 5 y = 1 
fourth_path = 0 # x = 7 y = 1 
fifth_path = 0 # x = 1 y = 2 

x_position = 0
y_position = 0 

while y_position < map.length
    first_path += 1 if map[y_position][x_position] == '#'
    x_position += 1
    y_position += 1 
end

x_position = 0
y_position = 0 

while y_position < map.length
    second_path += 1 if map[y_position][x_position] == '#'
    x_position += 3
    y_position += 1 
end

x_position = 0
y_position = 0 

while y_position < map.length
    third_path += 1 if map[y_position][x_position] == '#'
    x_position += 5
    y_position += 1 
end

x_position = 0
y_position = 0 

while y_position < map.length
    fourth_path += 1 if map[y_position][x_position] == '#'
    x_position += 7
    y_position += 1 
end

x_position = 0
y_position = 0 

while y_position < map.length
    fifth_path += 1 if map[y_position][x_position] == '#'
    x_position += 1
    y_position += 2
end

solution = first_path * second_path * third_path * fourth_path * fifth_path
puts solution