file = File.open('input.txt')
numbers = file.readlines.map(&:chomp)

j = 0 
x = -1
y = -1 
z = -1

while j < numbers.length - 2
    k = j + 1
    while k < numbers.length - 1 
        l = k + 1
        while l < numbers.length
            sum = numbers[j].to_i + numbers[k].to_i + numbers[l].to_i
            if sum == 2020
                x = numbers[j].to_i
                y = numbers[k].to_i
                z = numbers[l].to_i
                j = numbers.length
                k = numbers.length
                l = numbers.length
            end
            l += 1
        end
        k += 1
    end
    j += 1
end

puts x * y * z
