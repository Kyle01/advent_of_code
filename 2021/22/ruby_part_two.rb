file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

def handle_instruction(line, diagram)
    instruction = line.split(' ')[0]
    steps = line.split(' ')[1].split(',')
    x_instruction = steps[0].split("=")[1].split("..").map(&:to_i)
    y_instruction = steps[1].split("=")[1].split("..").map(&:to_i)
    z_instruction = steps[2].split("=")[1].split("..").map(&:to_i)

    if instruction == 'on'
        x_ranges = diagram['x']
        handled_x = false
        new_x_ranges = []
        x_ranges.each do |x_range|
            if x_instruction[0].between?(x_range[0], x_range[1]) || x_instruction[1].between?(x_range[0], x_range[1])
                new_x_ranges << [[x_instruction[0], x_range[0]].min, [x_instruction[1], x_range[1]].max]
                handled_x = true
            else
                new_x_ranges << x_range
            end
        end
        new_x_ranges << x_instruction unless handled_x
        diagram['x'] = new_x_ranges

        y_ranges = diagram['y']
        handled_y = false
        new_y_ranges = []
        y_ranges.each do |y_range|
            if y_instruction[0].between?(y_range[0], y_range[1]) || y_instruction[1].between?(y_range[0], y_range[1])
                new_y_ranges << [[y_instruction[0], y_range[0]].min, [y_instruction[1], y_range[1]].max]
                handled_y = true
            else
                new_y_ranges << y_range
            end
        end
        new_y_ranges << y_instruction unless handled_y
        diagram['y'] = new_y_ranges

        z_ranges = diagram['z']
        handled_z = false
        new_z_ranges = []
        z_ranges.each do |z_range|
            if z_instruction[0].between?(z_range[0], z_range[1]) || z_instruction[1].between?(z_range[0], z_range[1])
                new_z_ranges << [[z_instruction[0], z_range[0]].min, [z_instruction[1], z_range[1]].max]
                handled_z = true
            else
                new_z_ranges << z_range
            end
        end
        new_z_ranges << z_instruction unless handled_z
        diagram['z'] = new_z_ranges
    else
        x_ranges = diagram['x']
        new_x_ranges = []
        x_ranges.each do |x_range|
            if x_instruction[0].between?(x_range[0], x_range[1]) || x_instruction[1].between?(x_range[0], x_range[1])
                if x_instruction[0] <= x_range[0] && x_instruction[1] >= x_range[1]
                    next
                elsif x_instruction[0] <= x_range[0]
                    new_x_ranges << [x_instruction[1]+1, x_range[1]]
                elsif x_instruction[1] >= x_range[1]
                    new_x_ranges << [x_range[0],x_instruction[0]-1]
                else
                    new_x_ranges << [x_range[0], x_instruction[0]-1]
                    new_x_ranges << [x_instruction[1]+1, x_range[1]]
                end
            end
        end
        diagram['x'] = new_x_ranges

        # y_range = steps[1].split("=")[1].split("..").map(&:to_i)
        # z_range = steps[2].split("=")[1].split("..").map(&:to_i)
    end

    diagram
end

diagram  = { 'x' => [], 'y' => [], 'z' => [] }
lines.each_with_index do |line, i|
    diagram = handle_instruction(line, diagram)
    puts diagram
end