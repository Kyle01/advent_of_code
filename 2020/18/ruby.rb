def is_operator?(char)
    return true if char == '+'
    return true if char == '*'
    false
end

def is_number?(char)
    return true if char == '0'
    return true if char == '1'
    return true if char == '2'
    return true if char == '3'
    return true if char == '4'
    return true if char == '5'
    return true if char == '6'
    return true if char == '7'
    return true if char == '8'
    return true if char == '9'
    false
end

def evaluate(num_one, num_two, operator)
    if operator == '*'
        num_one * num_two
    else
        num_one + num_two
    end
end

def parse_nums(line)
    nums = []
    num = ""
    line.split('').each do |char|
        if is_number?(char)
            num << char
        elsif !num.empty?
            nums << num.to_i
            num = ""
        end
    end
    if !num.empty?
        nums << num.to_i
    end
    nums
end

def parse_operators(line)
    operators = []
    line.split('').each do |char|
        if is_operator?(char)
            operators << char
        end
    end
    operators
end

def compute_values(nums, operators)
    while nums.length > 1
        puts nums.join(',')
        puts operators.join(',')
        operator = operators.shift 
        num_one = nums.shift
        num_two = nums.shift
        result = evaluate(num_one, num_two, operator)
        nums.unshift(result)
    end
    
    nums
end

def compute_line(line)
    nums = parse_nums(line)
    operators = parse_operators(line)

    while line.include?('(')
        left_p_count = 0 
        start_i = -1
        end_i = -1
        line.split('').each_with_index do |char, i|
            if char == '(' && left_p_count == 0 
                left_p_count += 1 
                start_i = i
            elsif char == '('
                left_p_count += 1
            elsif char == ')'
                left_p_count -= 1 
                if left_p_count == 0
                    end_i = i
                end
            end
        end
        inner = line[start_i+1...end_i]
        line[start_i..end_i] = compute_line(inner).to_s 
        return compute_line(line)
    end

    compute_values(nums, operators)
end

file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

accumulator = 0 
input_lines.each do |line|
    accumulator += compute_line(line)
end

puts accumulator