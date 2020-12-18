class PowerCube 
    def initialize(input)
        @tesseract = []

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

        dimension.times do |w|
            cube = []
            dimension.times do |x|
                if middle_index == w && middle_index == x 
                    cube << input
                else
                    cube << blank_sheet
                end
            end
            @tesseract << cube
        end
    end

    def to_s
        str = ""
        @tesseract.each_with_index do |cube, i|
            cube.each_with_index do |sheet, j|
                str += "z=#{j - sheet.length/2} w:#{i - sheet.count/2}\n"
                sheet.each do |row|
                    str += row + "\n"
                end
                str += "\n"
            end
        end
        str 
    end

    def cycle
        blue_print_box = grow_box
        @tesseract = grow_box

        blue_print_box.each_with_index do |cube, z|
            cube.each_with_index do |sheet, y|
                sheet.each_with_index do |row, x|
                    row.split('').each_with_index do |cell, w|
                        active_neighbors = count_active_neighbors(blue_print_box, w, x, y, z)
                        # puts "X: #{x}, Y: #{y}, Z: #{z}, dimension: #{@cube.length}, A#{active_neighbors}"
                        next_state = next_state(cell, active_neighbors)
                        @tesseract[z][y][x][w] = next_state
                    end
                end
            end
        end
    end

    def active_cells
        count = 0 
        @tesseract.each do |cube|
            cube.each do |sheet|
                sheet.each do |row|
                    row.split('').each do |cell|
                        count += 1 if cell == '#'
                    end
                end
            end
        end
        count
    end

    private
    def grow_box
        dimension = @tesseract.size+2
        tesseract = []
        dimension.times do |_|
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
            tesseract << next_box
        end

        @tesseract.each_with_index do |cube, z|
            cube.each_with_index do |sheet, y|
                sheet.each_with_index do |row, x|
                        row.split('').each_with_index do |cell, w|
                            tesseract[w+1][z+1][y+1][x+1] = cell
                        end
                    end
                end
            end
        tesseract 
    end


    def count_active_neighbors(box, w, z, y, x)
        active_neighbors = 0 
        active_neighbors += 1 if check_square(box, w-1, x-1, y-1, z-1)
        active_neighbors += 1 if check_square(box, w-1, x-1, y-1, z)
        active_neighbors += 1 if check_square(box, w-1, x-1, y-1, z+1)
        active_neighbors += 1 if check_square(box, w-1, x-1, y, z-1)
        active_neighbors += 1 if check_square(box, w-1, x-1, y, z)
        active_neighbors += 1 if check_square(box, w-1, x-1, y, z+1)
        active_neighbors += 1 if check_square(box, w-1, x-1, y+1, z-1)
        active_neighbors += 1 if check_square(box, w-1, x-1, y+1, z)
        active_neighbors += 1 if check_square(box, w-1, x-1, y+1, z+1)
        active_neighbors += 1 if check_square(box, w-1, x, y-1, z-1)
        active_neighbors += 1 if check_square(box, w-1, x, y-1, z)
        active_neighbors += 1 if check_square(box, w-1, x, y-1, z+1)
        active_neighbors += 1 if check_square(box, w-1, x, y, z-1)
        active_neighbors += 1 if check_square(box, w-1, x, y, z)
        active_neighbors += 1 if check_square(box, w-1, x, y, z+1)
        active_neighbors += 1 if check_square(box, w-1, x, y+1, z-1)
        active_neighbors += 1 if check_square(box, w-1, x, y+1, z)
        active_neighbors += 1 if check_square(box, w-1, x, y+1, z+1)
        active_neighbors += 1 if check_square(box, w-1, x+1, y-1, z-1)
        active_neighbors += 1 if check_square(box, w-1, x+1, y-1, z)
        active_neighbors += 1 if check_square(box, w-1, x+1, y-1, z+1)
        active_neighbors += 1 if check_square(box, w-1, x+1, y, z-1)
        active_neighbors += 1 if check_square(box, w-1, x+1, y, z)
        active_neighbors += 1 if check_square(box, w-1, x+1, y, z+1)
        active_neighbors += 1 if check_square(box, w-1, x+1, y+1, z-1)
        active_neighbors += 1 if check_square(box, w-1, x+1, y+1, z)
        active_neighbors += 1 if check_square(box, w-1, x+1, y+1, z+1)
        active_neighbors += 1 if check_square(box, w, x-1, y-1, z-1)
        active_neighbors += 1 if check_square(box, w, x-1, y-1, z)
        active_neighbors += 1 if check_square(box, w, x-1, y-1, z+1)
        active_neighbors += 1 if check_square(box, w, x-1, y, z-1)
        active_neighbors += 1 if check_square(box, w, x-1, y, z)
        active_neighbors += 1 if check_square(box, w, x-1, y, z+1)
        active_neighbors += 1 if check_square(box, w, x-1, y+1, z-1)
        active_neighbors += 1 if check_square(box, w, x-1, y+1, z)
        active_neighbors += 1 if check_square(box, w, x-1, y+1, z+1)
        active_neighbors += 1 if check_square(box, w, x, y-1, z-1)
        active_neighbors += 1 if check_square(box, w, x, y-1, z)
        active_neighbors += 1 if check_square(box, w, x, y-1, z+1)
        active_neighbors += 1 if check_square(box, w, x, y, z-1)
        active_neighbors += 1 if check_square(box, w, x, y, z+1)
        active_neighbors += 1 if check_square(box, w, x, y+1, z-1)
        active_neighbors += 1 if check_square(box, w, x, y+1, z)
        active_neighbors += 1 if check_square(box, w, x, y+1, z+1)
        active_neighbors += 1 if check_square(box, w, x+1, y-1, z-1)
        active_neighbors += 1 if check_square(box, w, x+1, y-1, z)
        active_neighbors += 1 if check_square(box, w, x+1, y-1, z+1)
        active_neighbors += 1 if check_square(box, w, x+1, y, z-1)
        active_neighbors += 1 if check_square(box, w, x+1, y, z)
        active_neighbors += 1 if check_square(box, w, x+1, y, z+1)
        active_neighbors += 1 if check_square(box, w, x+1, y+1, z-1)
        active_neighbors += 1 if check_square(box, w, x+1, y+1, z)
        active_neighbors += 1 if check_square(box, w, x+1, y+1, z+1)
        active_neighbors += 1 if check_square(box, w+1, x-1, y-1, z-1)
        active_neighbors += 1 if check_square(box, w+1, x-1, y-1, z)
        active_neighbors += 1 if check_square(box, w+1, x-1, y-1, z+1)
        active_neighbors += 1 if check_square(box, w+1, x-1, y, z-1)
        active_neighbors += 1 if check_square(box, w+1, x-1, y, z)
        active_neighbors += 1 if check_square(box, w+1, x-1, y, z+1)
        active_neighbors += 1 if check_square(box, w+1, x-1, y+1, z-1)
        active_neighbors += 1 if check_square(box, w+1, x-1, y+1, z)
        active_neighbors += 1 if check_square(box, w+1, x-1, y+1, z+1)
        active_neighbors += 1 if check_square(box, w+1, x, y-1, z-1)
        active_neighbors += 1 if check_square(box, w+1, x, y-1, z)
        active_neighbors += 1 if check_square(box, w+1, x, y-1, z+1)
        active_neighbors += 1 if check_square(box, w+1, x, y, z-1)
        active_neighbors += 1 if check_square(box, w+1, x, y, z)
        active_neighbors += 1 if check_square(box, w+1, x, y, z+1)
        active_neighbors += 1 if check_square(box, w+1, x, y+1, z-1)
        active_neighbors += 1 if check_square(box, w+1, x, y+1, z)
        active_neighbors += 1 if check_square(box, w+1, x, y+1, z+1)
        active_neighbors += 1 if check_square(box, w+1, x+1, y-1, z-1)
        active_neighbors += 1 if check_square(box, w+1, x+1, y-1, z)
        active_neighbors += 1 if check_square(box, w+1, x+1, y-1, z+1)
        active_neighbors += 1 if check_square(box, w+1, x+1, y, z-1)
        active_neighbors += 1 if check_square(box, w+1, x+1, y, z)
        active_neighbors += 1 if check_square(box, w+1, x+1, y, z+1)
        active_neighbors += 1 if check_square(box, w+1, x+1, y+1, z-1)
        active_neighbors += 1 if check_square(box, w+1, x+1, y+1, z)
        active_neighbors += 1 if check_square(box, w+1, x+1, y+1, z+1)
        active_neighbors
    end

    def check_square(box, w, x, y, z)
        valid_square(box, w, x, y, z) && box[w][x][y][z] == '#'
    end

    def valid_square(box, w, x, y, z)
        if w < 0 || w >= box.length
            return false 
        end
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
6.times do |_|
    cube.cycle
    puts cube
end

puts cube.active_cells