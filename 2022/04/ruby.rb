def fully_contained?(line)
    a, b = line.split(',')
    arr_one = (a.split('-')[0]..a.split('-')[1]).to_a
    arr_two = (b.split('-')[0]..b.split('-')[1]).to_a

    return true if arr_one.any? { |e| arr_two.include?(e) }
    return true if arr_two.any? { |e| arr_one.include?(e) }

    false
end

count = 0 
lines = File.open('input.txt').readlines.map(&:chomp)
lines.each { |line| count += 1 if fully_contained?(line) }

puts count