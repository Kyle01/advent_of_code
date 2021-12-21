def puzzle_to_s(puzzle_input)
    str = ""
    puzzle_input.each do |line|
        if line.class == Array
            str += line.join('') + "\n"
        else 
            str += line + "\n"
        end
    end
    str
end

def count_lights(puzzle_input)
    count = 0
    puzzle_input.each do |line|
        count += line.count('#')
    end
    count
end

def get_neighbors(puzzle_input, x, y)
    neighbors = []
    if x - 1 >= 0 && y - 1 >= 0
        neighbors << puzzle_input[y-1][x-1]
    end
    if y - 1 >= 0
        neighbors << puzzle_input[y-1][x]
    end
    if x + 1 < puzzle_input[0].length && y - 1 >= 0
        neighbors << puzzle_input[y-1][x+1]
    end
    if x - 1 >= 0
        neighbors << puzzle_input[y][x-1]
    end
    neighbors << puzzle_input[y][x]
    if x + 1 < puzzle_input[0].length
        neighbors << puzzle_input[y][x+1]
    end
    if x - 1 >= 0 && y + 1 < puzzle_input.length
        neighbors << puzzle_input[y+1][x-1]
    end
    if y + 1 < puzzle_input.length
        neighbors << puzzle_input[y+1][x]
    end
    if x + 1 < puzzle_input[0].length && y + 1 < puzzle_input.length
        neighbors << puzzle_input[y+1][x+1]
    end
    neighbors
end

def convert_to_binary(input)
    str = ""
    input.each do |char|
        if char == '#'
            str += '1'
        else
            str += '0'
        end
    end
    str
end

def increment_lights(puzzle_input, decode_algorith)
    new_puzzle = []
    puzzle_input.each_with_index do |row, i|
        new_row = []
        row.each_with_index do |light, j|
            neighbors = get_neighbors(puzzle_input, i, j)
            binary = convert_to_binary(neighbors)
            new_row << decode_algorith[binary.to_i(2)]
        end
        new_puzzle << new_row
    end
    new_puzzle
end

def expand_puzzle(puzzle_input)
    expand_amount = 3
    new_col_size = puzzle_input[0].length + expand_amount + 1
    new_row_size = puzzle_input.length + expand_amount + 1
    new_puzzle = []
    j = 0 
    while j < new_col_size + 1
        new_row = []
        i = 0
        while i < new_row_size + 1
            if j - expand_amount >= 0 && j - expand_amount < puzzle_input.length && i - expand_amount >= 0 && i - expand_amount < puzzle_input[0].length
                new_row << puzzle_input[j - expand_amount][i - expand_amount]
            else
                new_row << '.'
            end
            i += 1
        end
        new_puzzle << Array(new_row)
        j += 1
    end
    new_puzzle
end

file = File.open('input.txt')
lines = file.readlines.map(&:chomp)
decode_algorith = lines[0]
puzzle_input = lines[2..-1]

puts "Step 1: #{count_lights(puzzle_input)}"
puts puzzle_to_s(puzzle_input)
puts "\n"
puzzle_input = expand_puzzle(puzzle_input)
puts puzzle_to_s(puzzle_input)
puts "\n"
puzzle_input = increment_lights(puzzle_input, decode_algorith)
puts "\n"
puts "Step 2: #{count_lights(puzzle_input)}"
puts puzzle_to_s(puzzle_input)
puts "\n"
puzzle_input = expand_puzzle(puzzle_input)
puts puzzle_to_s(puzzle_input)
puts "\n"
puzzle_input = increment_lights(puzzle_input, decode_algorith)
puts "\n"