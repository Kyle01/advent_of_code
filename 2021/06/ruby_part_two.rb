file = File.open('input.txt')
input = file.readlines.map(&:chomp)[0].split(',').map(&:to_i)

def print_status(fish, day)
    str = "DAY #{day} \n"
    fish.each do |key, value|
        str += "#{key} => #{value}, " 
    end
    str += "Count: #{count_fish(fish)}\n"
    str += "\n"
end

def construct_hash(fish)
    hash = Hash.new(0)
    fish.each do |f|
        hash[f] += 1 
    end
    hash
end

def count_fish(fish)
    fish.values.reduce(:+)
end

def iterate_fish(fish)
    updated_fish = Hash.new(0)
    fish.each do |key, value|
        if key == 0
            updated_fish[6] += value
            updated_fish[8] = value
        elsif key == 7 
            updated_fish[6] += value
        else
            updated_fish[key-1] = value
        end
    end
    updated_fish
end

day = 0
fish = construct_hash(input)
while day < 256
    # puts print_status(fish, day)
    day += 1 
    fish = iterate_fish(fish)
end
puts count_fish(fish)