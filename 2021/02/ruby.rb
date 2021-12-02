file = File.open('input.txt')
numbers = file.readlines.map(&:chomp)

horitzontal_position = 0
depth = 0 

k = 0 
while k < numbers.length
    case numbers[k].split(' ')[0]
    when 'forward'
        horitzontal_position += numbers[k].split(' ')[1].to_i
    when 'up'
        depth += numbers[k].split(' ')[1].to_i
    when 'down'
        depth -= numbers[k].split(' ')[1].to_i
    end
    k += 1 
end

puts (horitzontal_position * depth).abs