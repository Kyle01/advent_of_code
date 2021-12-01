
class PowerCube 
    def initialize(input)
        @cube = []

        dimension = input.length
        middle_index = dimension/2
        
        blank_sheet = []
        dimension.times do |_|
            row = []
            dimension.times do |_|
                row << '.'
            end
            blank_sheet << row.join('')
        end

        dimension.times do |t|
            if middle_index == t
                @cube << input
            else
                @cube << blank_sheet
            end
        end
    end

    def to_s
        str = ""
        @cube.each_with_index do |sheet, i|
            str += "z=#{i-sheet.length/2}\n"
            sheet.each do |row|
                str += row + "\n"
            end
            str += "\n"
        end
        str 
    end

    def cycle
        # Create new enlarged box 
        # go through current cube
        # for each cell, find neighbors and count active
        # for the enlarged box, set the current stuff
        # set 
        blue_print_box = grow_box
        @cube = grow_box

        blue_print_box.each_with_index do |sheets, z|
            sheets.each_with_index do |row, y|
                row.split('').each_with_index do |cell, x|
                    active_neighbors = count_active_neighbors(blue_print_box, x, y, z)
                    # puts "X: #{x}, Y: #{y}, Z: #{z}, dimension: #{@cube.length}, A#{active_neighbors}"
                    next_state = next_state(cell, active_neighbors)
                    @cube[z][y][x] = next_state
                end
            end
        end
    end

    def active_cells
        count = 0 
        @cube.each do |sheets|
            sheets.each do |row|
                row.split('').each do |cell|
                    count += 1 if cell == '#'
                end
            end
        end
        count
    end

    private
    def grow_box
        dimension = @cube.size+2
        next_box = []
        dimension.times do |_|
            sheet = []
            dimension.times do |_|
                row = []
                dimension.times do |_|
                    row << '.'
                end
                sheet << row.join('')
            end
            next_box << sheet
        end

        @cube.each_with_index do |sheets, z|
            sheets.each_with_index do |row, y|
                    row.split('').each_with_index do |cell, x|
                    next_box[z+1][y+1][x+1] = cell
                end
            end
        end
        next_box 
    end

    def count_active_neighbors(box, z, y, x)
        active_neighbors = 0 
        active_neighbors += 1 if check_square(box, x-1, y-1, z-1)
        active_neighbors += 1 if check_square(box, x-1, y-1, z)
        active_neighbors += 1 if check_square(box, x-1, y-1, z+1)
        active_neighbors += 1 if check_square(box, x-1, y, z-1)
        active_neighbors += 1 if check_square(box, x-1, y, z)
        active_neighbors += 1 if check_square(box, x-1, y, z+1)
        active_neighbors += 1 if check_square(box, x-1, y+1, z-1)
        active_neighbors += 1 if check_square(box, x-1, y+1, z)
        active_neighbors += 1 if check_square(box, x-1, y+1, z+1)
        active_neighbors += 1 if check_square(box, x, y-1, z-1)
        active_neighbors += 1 if check_square(box, x, y-1, z)
        active_neighbors += 1 if check_square(box, x, y-1, z+1)
        active_neighbors += 1 if check_square(box, x, y, z-1)
        active_neighbors += 1 if check_square(box, x, y, z+1)
        active_neighbors += 1 if check_square(box, x, y+1, z-1)
        active_neighbors += 1 if check_square(box, x, y+1, z)
        active_neighbors += 1 if check_square(box, x, y+1, z+1)
        active_neighbors += 1 if check_square(box, x+1, y-1, z-1)
        active_neighbors += 1 if check_square(box, x+1, y-1, z)
        active_neighbors += 1 if check_square(box, x+1, y-1, z+1)
        active_neighbors += 1 if check_square(box, x+1, y, z-1)
        active_neighbors += 1 if check_square(box, x+1, y, z)
        active_neighbors += 1 if check_square(box, x+1, y, z+1)
        active_neighbors += 1 if check_square(box, x+1, y+1, z-1)
        active_neighbors += 1 if check_square(box, x+1, y+1, z)
        active_neighbors += 1 if check_square(box, x+1, y+1, z+1)
        active_neighbors
    end

    def check_square(box, x, y, z)
        valid_square(box, x, y, z) && box[x][y][z] == '#'
    end

    def valid_square(box, x, y, z)
        if x < 0 || x >= box.length
            return false 
        end
        if y < 0 || y >= box[0].length
            return false 
        end
        if z < 0 || z >= box[0].length
            return false 
        end
        true
    end

    def next_state(cell, active_neighbors)
        if cell == '#'
            if active_neighbors == 2 || active_neighbors == 3
                return '#'
            else
                return '.'
            end
        else
            if active_neighbors == 3
                return '#'
            else
                return '.'
            end
        end
    end
end

file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

cube = PowerCube.new(input_lines)
puts cube 
puts
puts 
puts 
puts 
puts

6.times do |_|
    cube.cycle
    
    puts cube
    puts
    puts 
    puts 
    puts 
    puts
end

puts cube.active_cells