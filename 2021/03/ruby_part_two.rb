file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

## Part 1 

oxygen = ""
carbon_dioxide = ""
pattern_length = lines[0].length

approved_lines = []
k = 0
while lines.length > 1
    zero_count = 0
    one_count = 0
    lines.each do |line|
        line[k] == "0" ? zero_count += 1 : one_count += 1 
    end
    lines.each do |line|
        if zero_count > one_count
            approved_lines << line if line[k] == "0"
        else 
            approved_lines << line if line[k] == "1"
        end
    end

    lines = approved_lines
    approved_lines = []
    k >= pattern_length - 1 ? k = 0 : k += 1
end

oxygen = lines[0].to_i(2)

file = File.open('input.txt')
lines = file.readlines.map(&:chomp)
approved_lines = []
k = 0
while lines.length > 1
    zero_count = 0
    one_count = 0
    lines.each do |line|
        line[k] == "0" ? zero_count += 1 : one_count += 1 
    end
    lines.each do |line|
        if zero_count <= one_count
            approved_lines << line if line[k] == "0"
        else 
            approved_lines << line if line[k] == "1"
        end
    end

    lines = approved_lines
    approved_lines = []
    k >= pattern_length - 1 ? k = 0 : k += 1
end

carbon = lines[0].to_i(2)

puts carbon * oxygen