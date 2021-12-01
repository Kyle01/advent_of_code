file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

seats = input_lines.map{|line| line.split('')}
stable = false

# seats.each { |x| puts x.join(" ") }
# puts 

def number_of_adjacent_seats_filled(map, x, y)
    adjacent_seats_filled = 0
    if x - 1 >= 0 && y - 1 >= 0 #Check SW
        adjacent_seats_filled += 1 if map[x-1][y-1] == '#'
    end
    if x - 1 >= 0 && y + 1 < map[x].length #Check NW
        adjacent_seats_filled += 1 if map[x-1][y+1] == '#'
    end
    if x + 1 < map.length && y + 1 < map[x].length #Check SE
        adjacent_seats_filled += 1 if map[x+1][y+1] == '#'
    end
    if x + 1 < map.length && y - 1 >= 0 #Check NE
        adjacent_seats_filled += 1 if map[x+1][y-1] == '#'
    end
    if x - 1 >= 0 #Check W
        adjacent_seats_filled += 1 if map[x-1][y] == '#'
    end
    if x + 1 < map.length #Check E
        adjacent_seats_filled += 1 if map[x+1][y] == '#'
    end
    if y - 1 >= 0 #Check S
        adjacent_seats_filled += 1 if map[x][y-1] == '#'
    end
    if y + 1 < map[x].length #Check N
        adjacent_seats_filled += 1 if map[x][y+1] == '#'
    end
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
            elsif seats[j][k] == "#" && number_of_adjacent_seats_filled(seats, j, k) >= 4
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