file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

def create_map(lines)
    map = []
    lines.each do |line|
        map << line.split('')
    end
    map
end

def step(map)
    map = step_east(map)
    map = step_south(map)
    map
end

def step_east(map)
    new_map = []

    j = 0 
    while j < map.length
        k = 0 
        new_row = []
        while k < map[0].length
            if k == map[0].length - 1
                if map[j][k] == '>' && map[j][0] == '.'
                    new_row << '.'
                    new_row[0] = '>'
                    k += 1
                else
                    new_row << map[j][k]
                    k += 1
                end
            elsif map[j][k] == '>'
                    if map[j][k+1] == '.'
                    new_row << '.'
                    new_row << '>'
                    k += 2
                else
                    new_row << map[j][k]
                    k += 1
                end
            else
                new_row << map[j][k]
                k += 1
            end
        end
        new_map << new_row
        j += 1
    end
    new_map
end

def step_south(map)
    new_map = Marshal.load(Marshal.dump(map))
    j = 0 
    while j < map.length
        k = 0 
        while k < map[0].length
            if j == map.length - 1 && map[j][k] == 'v' && map[0][k] == '.'
                new_map[0][k] = 'v'
                new_map[j][k] = '.'
            elsif map[j][k] == 'v' && j < map.length - 1 && map[j+1][k] == '.'
                new_map[j][k] = '.'
                new_map[j+1][k] = 'v'
            end
            k += 1
        end
        j += 1 
    end
    new_map
end

def stuck?(a, b)
    sol = true
    a.each_with_index do |row, i|
        row.each_with_index do |col, j|
            if col != b[i][j]
                sol = false
            end
        end
    end
    sol
end

map = create_map(lines)
stuck = false 
k = 1
while !stuck
    new_map = step(map)
    stuck = stuck?(map, new_map)
    puts "Step #{k}: stuck: #{stuck}"
    map = new_map
    # map.each { |x| puts x.join(" ") }
    # puts "\n"
    k += 1 
end
