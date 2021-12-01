file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)
input_lines.map!(&:to_i).sort!

current = 0 
number_of_combintations = 0 

# puts "1: #{one_diff}, 3: #{three_diff}"
puts one_diff * three_diff
