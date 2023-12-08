lines = File.open('input.txt').readlines.map(&:chomp)

def make_map lines
    hash = Hash.new
    lines.each do|line|
        source = line.split(' ')[1].to_i
        destination = line.split(' ')[0].to_i
        len = line.split(' ')[2].to_i

        len.times do |i|
            hash[source + i] = destination + i
        end
    end
    hash
end

seeds = lines[0].split(': ')[1].split(" ").map(&:to_i)

k = 0 
while k < lines.length
    if lines[k] == "seed-to-soil map:"
        k += 1 
        input = []
        while lines[k] != ""
            input << lines[k]
            k += 1
        end
        seed_soil_map = make_map input
    elsif lines[k] == "soil-to-fertilizer map:"
        k += 1 
        input = []
        while lines[k] != ""
            input << lines[k]
            k += 1
        end
        soil_fertiziler_map = make_map input
    elsif lines[k] == "fertilizer-to-water map:"
        k += 1 
        input = []
        while lines[k] != ""
            input << lines[k]
            k += 1
        end
        fertilizer_water_map = make_map input
    elsif lines[k] == "water-to-light map:"
        k += 1 
        input = []
        while lines[k] != ""
            input << lines[k]
            k += 1
        end
        water_light_map = make_map input
    elsif lines[k] == "light-to-temperature map:"
        k += 1 
        input = []
        while lines[k] != ""
            input << lines[k]
            k += 1
        end
        light_temperature_map = make_map input
    elsif lines[k] == "temperature-to-humidity map:"
        k += 1 
        input = []
        while lines[k] != ""
            input << lines[k]
            k += 1
        end
        temperature_humidity_map = make_map input
    elsif lines[k] == "humidity-to-location map:"
        k += 1 
        input = []
        while lines[k] != "" && k < lines.length
            input << lines[k]
            k += 1
        end
        humidity_location_map = make_map input
    end
    puts k
    k += 1
end

locations = []
seeds.each do |seed|
    loc = seed 
    loc = seed_soil_map.key?(loc) ? seed_soil_map[loc] : loc
    loc = soil_fertiziler_map.key?(loc) ? soil_fertiziler_map[loc] : loc
    loc = fertilizer_water_map.key?(loc) ? fertilizer_water_map[loc] : loc
    loc = water_light_map.key?(loc) ? water_light_map[loc] : loc
    loc = light_temperature_map.key?(loc) ? light_temperature_map[loc] : loc
    loc = temperature_humidity_map.key?(loc) ? temperature_humidity_map[loc] : loc
    loc = humidity_location_map.key?(loc) ? humidity_location_map[loc] : loc
    locations << loc
end

puts locations.join(', ')
puts locations.min