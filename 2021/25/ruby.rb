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
    map
end

def stuck?(a, b)
    false
end

map = create_map(lines)
puts 'Step: 0'
map.each { |x| puts x.join(" ") }
puts "\n"

k = 1
while k < 2
    new_map = step(map)
    stuck = stuck?(map, new_map)
    puts "Step #{k}: stuck: #{stuck}"
    map = new_map
    map.each { |x| puts x.join(" ") }
    puts "\n"
    k += 1 
end
