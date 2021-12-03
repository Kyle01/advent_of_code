file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

## Part 1 

gamma = ""
epsilon = ""

k = 0
while k < lines[0].length
    zero_count = 0
    one_count = 0
    lines.each do |line|
        line[k] == "0" ? zero_count += 1 : one_count += 1 
    end
    if zero_count > one_count
        gamma << "0"
        epsilon << "1"
    else
        gamma << "1"
        epsilon << "0"
    end
    k += 1 
end

gamma = gamma.to_i(2)
epsilon = epsilon.to_i(2)

puts gamma * epsilon