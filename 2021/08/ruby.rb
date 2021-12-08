file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

lines.map! { |line| line.split(' | ')[1] }
unique_length = [2, 3, 4, 7]
unique_num_count = 0


lines.each do |line|
    words = line.split(' ')
    words.each do |word|
        unique_num_count += 1 if unique_length.include?(word.length)
    end
end

puts unique_num_count