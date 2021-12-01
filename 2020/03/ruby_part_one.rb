file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)


length_needed = (input_lines.count - 1) * 3 + 1
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

x_position = 0
y_position = 0 
tree_count = 0

while y_position < map.length
    tree_count += 1 if map[y_position][x_position] == '#'
    x_position += 3
    y_position += 1 
end

puts tree_count