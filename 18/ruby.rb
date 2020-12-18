def is_symbol?(char)
    return true if char == '+'
    return true if char == '*'
    false
end

def evaluate(num_one, num_two, operator)
    if operator == '*'
        num_one * num_two
    else
        num_one + num_two
    end
end

def compute_line(line)
    nums = []
    operators = []
    puts line
    
    line.split(" ").each_with_index do |char, i|
        if char == ' '
            next
        elsif char == '('
            close_index = line[i..-1].split('').find_index(')')
            puts close_index
            line[i+1...close_index] = compute_line(line[i+1..close_index]).to_s
        elsif is_symbol?(char)
            operators << char
        elsif
            nums << char.to_i
        end
    end

    accumulator = 0
    while nums.length > 1 || !operators.empty?
        accumulator = evaluate(nums.shift, nums.shift, operators.shift)
        nums.unshift(accumulator)
        puts "N: #{nums.join(',')}"
        puts "O: #{operators.join(',')}"
    end
    accumulator
end

file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

input_lines.each {|line| puts compute_line(line)}