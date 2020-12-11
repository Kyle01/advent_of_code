file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

seats = input_lines.map{|line| line.split('')}
stable = false

# seats.each { |x| puts x.join(" ") }
# puts 

def check_direction(map, direction, x, y)
    if direction == 'W'
        x -= 1 
        while x >= 0 
            return 0 if map[x][y] == 'L'
            return 1 if map[x][y] == '#'
            x -= 1 
        end
        return 0
    elsif direction == 'E'
        x += 1 
        while x < map.length 
            return 0 if map[x][y] == 'L'
            return 1 if map[x][y] == '#'
            x += 1 
        end
        return 0
    elsif direction == 'N'
        y -= 1 
        while y >= 0 
            return 0 if map[x][y] == 'L'
            return 1 if map[x][y] == '#'
            y -= 1 
        end
        return 0
    elsif direction == 'S'
        y += 1 
        while y < map[x].length 
            return 0 if map[x][y] == 'L'
            return 1 if map[x][y] == '#'
            y += 1 
        end
        return 0
    elsif direction == 'NE'
        x += 1 
        y -= 1 
        while x < map.length && y >= 0
            return 0 if map[x][y] == 'L'
            return 1 if map[x][y] == '#'
            x += 1 
            y -= 1
        end
        return 0
    elsif direction == 'NW'
        x -= 1 
        y -= 1 
        while x >= 0 && y >= 0
            return 0 if map[x][y] == 'L'
            return 1 if map[x][y] == '#'
            x -= 1 
            y -= 1
        end
        return 0
    elsif direction == 'SE'
        x -= 1 
        y += 1 
        while x >= 0 && y < map[x].length
            return 0 if map[x][y] == 'L'
            return 1 if map[x][y] == '#'
            x -= 1 
            y += 1
        end
        return 0
    elsif direction == 'SW'
        x += 1 
        y += 1 
        while x < map.length && y < map[x].length
            return 0 if map[x][y] == 'L'
            return 1 if map[x][y] == '#'
            x += 1 
            y += 1
        end
        return 0
    end

    0
end

def number_of_adjacent_seats_filled(map, x, y)
    adjacent_seats_filled = 0
    adjacent_seats_filled += check_direction(map, 'N', x, y)
    adjacent_seats_filled += check_direction(map, 'S', x, y)
    adjacent_seats_filled += check_direction(map, 'E', x, y)
    adjacent_seats_filled += check_direction(map, 'W', x, y)
    adjacent_seats_filled += check_direction(map, 'NW', x, y)
    adjacent_seats_filled += check_direction(map, 'NE', x, y)
    adjacent_seats_filled += check_direction(map, 'SW', x, y)
    adjacent_seats_filled += check_direction(map, 'SE', x, y)
    adjacent_seats_filled
end

def create_deep_dup map 
    duplicate = []
    map.each do |row|
        new_row = []
        row.each do |value|
            new_row << value
        end
        duplicate << new_row
    end
    duplicate
end

def count_occupied_seats(seats)
    occupied_seats = 0 

    seats.each do |row|
        row.each do |seat|
            occupied_seats += 1 if seat == '#'
        end
    end

    occupied_seats 
end

while !stable
    new_layout = create_deep_dup(seats)
    stable = true
    j = 0 
    while j < seats.length
        k = 0 
        while k < seats[j].length
            if seats[j][k] == "L" && number_of_adjacent_seats_filled(seats, j, k) == 0
                new_layout[j][k] = '#'
                stable = false
            elsif seats[j][k] == "#" && number_of_adjacent_seats_filled(seats, j, k) >= 5
                new_layout[j][k] = "L"
                stable = false
            end
            k += 1 
        end
        j += 1 
    end
    seats = new_layout
    # seats.each { |x| puts x.join(" ") }
    # puts ""
end

puts count_occupied_seats(seats)