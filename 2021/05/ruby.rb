file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

def construct_grid(lines)
    lines.map! { |line| line.gsub(' -> ', ',') }
    x_points = []
    y_points = []
    lines.each do |line|
        arr = line.split(',')
        x_points << arr[0].to_i
        x_points << arr[2].to_i
        y_points << arr[1].to_i
        y_points << arr[3].to_i
    end
    Array.new(y_points.max + 1) { Array.new(x_points.max + 1, '.') }
end

def print_grid(grid)
    str = ""
    grid.each do |row|
        row.each do |col|
            str << col.to_s
        end
        str << "\n"
    end
    str
end

def valid_line(line)
    arr = line.gsub(' -> ', ',').split(',')
    return true if arr[0].to_i == arr[2].to_i || arr[1].to_i == arr[3].to_i
    false
end

def draw_lines(grid, line)
    return unless valid_line(line)
    arr = line.gsub(' -> ', ',').split(',')
    start_position = [arr[0].to_i, arr[1].to_i]
    end_position = [arr[2].to_i, arr[3].to_i]
    x_position = start_position[0]
    y_position = start_position[1]
    x_adjuster = end_position[0] > start_position[0] ? 1 : -1
    y_adjuster = end_position[1] > start_position[1] ? 1 : -1
    while x_position != end_position[0] || y_position != end_position[1]
        new_value = grid[y_position][x_position] == '.' ? 1 : grid[y_position][x_position] + 1
        grid[y_position][x_position] = new_value
        x_position += x_adjuster if x_position != end_position[0]
        y_position += y_adjuster if y_position != end_position[1]
    end
    new_value = grid[y_position][x_position] == '.' ? 1 : grid[y_position][x_position] + 1
    grid[y_position][x_position] = new_value
end

def count_intersections(grid)
    num = 0 
    grid.each do |row|
        row.each do |v|
            if v != '.'
                num += 1 if v > 1
            end
        end
    end
    num
end

grid = construct_grid(lines)
lines.each do |line|
    draw_lines(grid, line)
end
puts count_intersections(grid)