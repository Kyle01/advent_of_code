file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)
input_lines.map!(&:to_i).sort!

current = 0 
one_diff = 0 
three_diff = 0 

input_lines.each do |num|
    if num - 1 == current
        one_diff += 1 
        current += 1 
    else
        three_diff += 1 
        current += 3 
    end 
end
three_diff += 1 

# puts "1: #{one_diff}, 3: #{three_diff}"
puts one_diff * three_diff
