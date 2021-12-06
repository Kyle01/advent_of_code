file = File.open('input.txt')
fish = file.readlines.map(&:chomp)[0].split(',').map(&:to_i)

def print_status(fish, day)
    if day == 0 
        puts "Initial State: #{fish.size}"
    else 
        puts "Day #{day}: #{fish.size}"
    end
end

def iterate_fish(fish)
    new_fish = fish
    add_fish = []
    fish.each_with_index do |f, index|
        if f === 0 
            new_fish[index] = 6
            add_fish << 8
        else
            new_fish[index] = f - 1
        end
    end

    new_fish.concat(add_fish)
end

day = 0
while day < 80
    print_status(fish, day)
    day += 1 
    fish = iterate_fish(fish)
end

puts fish.size