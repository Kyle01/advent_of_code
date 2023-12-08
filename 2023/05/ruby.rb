lines = File.open('input.txt').readlines.map(&:chomp)

class FarmMap 
    def initialize lines 
        @sources = []
        @destinations = []
        @lengths = []
        lines.each do |line|
            source = line.split(' ')[1].to_i
            destination = line.split(' ')[0].to_i
            len = line.split(' ')[2].to_i

            @sources << source 
            @destinations << destination
            @lengths << len
        end
    end

    def convert num
        @sources.each_with_index do |source, i|
            length = @lengths[i]
            if num >= source && num < source + length 
                return @destinations[i] + (num - source)
            end
        end
        
        num
    end
end

seed_range = lines[0].split(': ')[1].split(" ").map(&:to_i)

k = 0 
while k < lines.length
    if lines[k] == "seed-to-soil map:"
        k += 1 
        input = []
        while lines[k] != ""
            input << lines[k]
            k += 1
        end
        seed_soil_map = FarmMap.new(input)
    elsif lines[k] == "soil-to-fertilizer map:"
        k += 1 
        input = []
        while lines[k] != ""
            input << lines[k]
            k += 1
        end
        soil_fertiziler_map = FarmMap.new(input)
    elsif lines[k] == "fertilizer-to-water map:"
        k += 1 
        input = []
        while lines[k] != ""
            input << lines[k]
            k += 1
        end
        fertilizer_water_map = FarmMap.new(input)
    elsif lines[k] == "water-to-light map:"
        k += 1 
        input = []
        while lines[k] != ""
            input << lines[k]
            k += 1
        end
        water_light_map = FarmMap.new(input)
    elsif lines[k] == "light-to-temperature map:"
        k += 1 
        input = []
        while lines[k] != ""
            input << lines[k]
            k += 1
        end
        light_temperature_map = FarmMap.new(input)
    elsif lines[k] == "temperature-to-humidity map:"
        k += 1 
        input = []
        while lines[k] != ""
            input << lines[k]
            k += 1
        end
        temperature_humidity_map = FarmMap.new(input)
    elsif lines[k] == "humidity-to-location map:"
        k += 1 
        input = []
        while lines[k] != "" && k < lines.length
            input << lines[k]
            k += 1
        end
        humidity_location_map = FarmMap.new(input)
    end
    k += 1
end

min = nil
k = 0 
previous_nums = []
while k < seed_range.length 
    start = seed_range[k]
    range = seed_range[k + 1]

    i = 0
    previous_nums = [] 
    while i < range
        loc = start + i
        loc = seed_soil_map.convert(loc)
        loc = soil_fertiziler_map.convert(loc)
        loc = fertilizer_water_map.convert(loc)
        loc = water_light_map.convert(loc)
        loc = light_temperature_map.convert(loc)
        loc = temperature_humidity_map.convert(loc)
        loc = humidity_location_map.convert(loc)
        min = loc if min.nil? || loc < min
        if (previous_nums.length > 100000 && previous_nums.max - previous_nums.min < 1000001) 
            i = range
        elsif previous_nums.length < 100001
            previous_nums << loc 
        else 
            previous_nums << loc 
            previous_nums.shift
        end
        puts previous_nums.max - previous_nums.min
        puts loc
        i += 1
    end
    puts k 
    k += 2
end

puts min
