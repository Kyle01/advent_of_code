file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

cubes = []

def handle_instruction(line, cubes)
    instruction = line.split(' ')[0]
    steps = line.split(' ')[1].split(',')

    if instruction == 'on'
        x_range = steps[0].split("=")[1].split("..").map(&:to_i)
        y_range = steps[1].split("=")[1].split("..").map(&:to_i)
        z_range = steps[2].split("=")[1].split("..").map(&:to_i)
        on_cubes = []

        i = x_range[0]
        while i <= x_range[1]
            j = y_range[0]
            while j <= y_range[1]
                k = z_range[0]
                while k <= z_range[1]
                    on_cubes << [i, j, k]
                    k += 1
                end
                j += 1
            end
            i += 1
        end

        on_cubes.each { |cube| cubes << cube }
        cubes = cubes.uniq
    else
        x_range = steps[0].split("=")[1].split("..").map(&:to_i)
        y_range = steps[1].split("=")[1].split("..").map(&:to_i)
        z_range = steps[2].split("=")[1].split("..").map(&:to_i)
        off_cubes = []

        i = x_range[0]
        while i <= x_range[1]
            j = y_range[0]
            while j <= y_range[1]
                k = z_range[0]
                while k <= z_range[1]
                    off_cubes << [i, j, k]
                    k += 1
                end
                j += 1
            end
            i += 1
        end

        cubes = cubes - off_cubes
    end

    cubes
end

lines.each_with_index do |line, i|
    cubes = handle_instruction(line, cubes)
    puts "step #{i+1}: #{cubes.length}"
end