lines = File.open('input.txt').readlines.map(&:chomp)
numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
answer = 0

lines.each do |line|
    solution = ""
    k = 0 
    while k < line.length 
        if numbers.include?(line[k])
            solution << line[k]
            k = line.length
        end
        k += 1
    end

    k = line.length - 1 
    while k >= 0
        if numbers.include?(line[k])
            solution << line[k]
            k = 0
        end
        k -= 1
    end

    puts solution.to_i
    answer += solution.to_i
end

puts answer