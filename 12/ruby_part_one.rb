file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

current_direction = 'east'
x = 0 
y = 0 

def handle_rotation(direction, current_direction, degrees)
    directions = ['north', 'east', 'south', 'west']
    current_index = directions.find_index(current_direction)
    if direction == 'left'
        if degrees == 90
            return directions[current_index-1]
        elsif degrees == 180
            return directions[current_index-2]
        else degrees == 270
            return directions[current_index-3]
        end
    else
        if degrees == 90
            spot = current_index+1
            spot -= 4 if spot >= 4
            return directions[spot]
        elsif degrees == 180
            spot = current_index+2
            spot -= 4 if spot >= 4
            return directions[spot]
        else degrees == 270
            spot = current_index+3
            spot -= 4 if spot >= 4
            return directions[spot]
        end
    end
    current_direction
end

input_lines.each do |line|
    key = line[0]
    magnitude = line.slice(1..-1).to_i

    case key
    when 'F'
        case current_direction
        when 'east'
            y += magnitude
        when 'west'
            y -= magnitude
        when 'south'
            x -= magnitude
        when 'north'
            x += magnitude
        else
            puts 'bad input provided'
        end
    when 'N'
        x += magnitude
    when 'S'
        x -= magnitude
    when 'E'
        y += magnitude
    when 'W'
        y -= magnitude
    when 'R'
        current_direction = handle_rotation('right', current_direction, magnitude)
    when 'L'
        current_direction = handle_rotation('left', current_direction, magnitude)
    else
        puts 'bad input provided'
    end
    puts line
    puts "x:#{x} y:#{y} d:#{current_direction}"
end

puts "x:#{x} y:#{y}"
puts x.abs + y.abs