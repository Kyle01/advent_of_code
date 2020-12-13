file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

nums = input_lines[1].split(',').map(&:to_i)
hash = {}

nums.each_with_index do |num, i|
    next if num == 0

    hash[num] = i
end

nums.delete(0)

found = false
test_attempt = nums[0]

puts hash 
puts nums.join(',')

while !found
    found = true 
    k = 0
    while k < nums.length
        if (test_attempt + hash[nums[k]]) % nums[k] != 0
            found = false
            k = nums.length
            test_attempt += 1 
        end
        k += 1
    end
end

puts test_attempt