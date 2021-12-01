file = File.open('input.txt')
numbers = file.readlines.map(&:chomp)

increment_count = 0 
k = 1
while k < numbers.length 
    if numbers[k].to_i > numbers[k-1].to_i
        increment_count += 1
    end
    k += 1
end
puts increment_count