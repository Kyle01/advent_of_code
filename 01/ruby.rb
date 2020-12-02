file = File.open('input.txt')
numbers = file.readlines.map(&:chomp)

j = 0 
x = -1
y = -1 

while j < numbers.length - 1
    k = j + 1
    while k < numbers.length
        if numbers[j].to_i + numbers[k].to_i == 2020
            x = numbers[j].to_i
            y = numbers[k].to_i
            j = numbers.length
            k = numbers.length
        end
        k += 1
    end
    j += 1
end

puts x * y
