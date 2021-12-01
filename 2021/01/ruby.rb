file = File.open('input.txt')
numbers = file.readlines.map(&:chomp)

# part 1
increment_count = 0 
k = 1
while k < numbers.length 
    if numbers[k].to_i > numbers[k-1].to_i
        increment_count += 1
    end
    k += 1
end
puts increment_count

# Part 2
increment_count = 0 
k = 3
while k < numbers.length
    window_one = numbers[k-3].to_i + numbers[k-2].to_i + numbers[k-1].to_i
    window_two = numbers[k-2].to_i + numbers[k-1].to_i + numbers[k].to_i
    if window_two > window_one
        increment_count += 1
    end
    k += 1
end
puts increment_count