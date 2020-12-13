file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

nums = input_lines[1].split(',').map(&:to_i)
hash = {}

nums.each_with_index do |num, i|
    next if num == 0

    hash[num] = i
end

puts hash