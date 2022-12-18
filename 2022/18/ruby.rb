lines = File.open('input.txt').readlines.map(&:chomp)

# lets name the sides under, over, north, south, east, west


def find_trapped_faces(lines)
    min = nil 
    max = nil 
    trapped_squares = 0

    lines.each do |line|
        x = line.split(',')[0].to_i
        y = line.split(',')[1].to_i
        z = line.split(',')[2].to_i

        min = [x,y,z].min if !min || [x,y,z].min > min 
        max = [x,y,z].max if !max || [x,y,z].max > max 
    end

    x, y, z = min, min, min 

    while x <= max 
        while y <= max 
            while z <= max 
                check = true
                str = "#{x},#{y},#{z}"
                check = false if lines.include?(str)
                check = false unless lines.include?("#{x},#{y},#{z+1}")
                check = false unless lines.include?("#{x},#{y},#{z-1}")
                check = false unless lines.include?("#{x},#{y+1},#{z}")
                check = false unless lines.include?("#{x},#{y-1},#{z}")
                check = false unless lines.include?("#{x+1},#{y},#{z}")
                check = false unless lines.include?("#{x-1},#{y},#{z}")

                trapped_squares += 1 if check 
                z += 1 
            end
            y += 1 
        end
        x += 1
    end

    trapped_squares * 6
end

def adjacent_side?(lines, line, side)
    adjacent = false
    test_line = ''
    x = line.split(',')[0].to_i
    y = line.split(',')[1].to_i
    z = line.split(',')[2].to_i

    case side
    when 'over'
        test_line = "#{x},#{y},#{z+1}"
    when 'under'
        test_line = "#{x},#{y},#{z-1}"
    when 'north'
        test_line = "#{x},#{y+1},#{z}"
    when 'south'
        test_line = "#{x},#{y-1},#{z}"
    when 'east'
        test_line = "#{x+1},#{y},#{z}"
    when 'west'
        test_line = "#{x-1},#{y},#{z}"
    end

    lines.each { |check_line| adjacent = true if check_line == test_line} 

    adjacent
end

def count_faces(lines, line)
    faces = 6

    faces -= 1 if adjacent_side?(lines, line, 'under')
    faces -= 1 if adjacent_side?(lines, line, 'over')
    faces -= 1 if adjacent_side?(lines, line, 'north')
    faces -= 1 if adjacent_side?(lines, line, 'south')
    faces -= 1 if adjacent_side?(lines, line, 'east')
    faces -= 1 if adjacent_side?(lines, line, 'west')

    faces
end

total_faces = 0 
lines.each {|line| total_faces += count_faces(lines, line)}

puts find_trapped_faces(lines)