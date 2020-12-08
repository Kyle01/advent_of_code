file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

def run_code input_lines
    accumulator = 0 
    k = 0 
    tracker = []
    solution = nil

    while k < input_lines.length
        success = true
        operation = input_lines[k].split(" ")[0]
        symbol = input_lines[k].split(" ")[1][0]
        number_length = input_lines[k].split(" ")[1].length
        magnitude = input_lines[k].split(" ")[1][1...number_length].to_i
        
        if operation == 'acc'
            if tracker[k].nil?
                symbol == '+' ? accumulator += magnitude : accumulator -= magnitude
                tracker[k] = accumulator
            else
                success = false
                solution = accumulator
                k = input_lines.length + 1
            end
            k += 1 
        elsif operation == 'jmp'
            symbol == '+' ? k += magnitude : k -= magnitude
        else 
            k += 1
        end
    end

    if success 
        accumulator
    else
        false
    end
end

j = 0 
while j < input_lines.length

    operation = input_lines[j].split(" ")[0]
    if operation == 'jmp'
        input_lines[j]["jmp"] = "nop"
        try = run_code(input_lines)
        puts try if try
        input_lines[j]["nop"] = "jmp"
    elsif operation == 'nop'
        input_lines[j]["nop"] = "jmp"
        try = run_code(input_lines)
        puts try if try
        input_lines[j]["jmp"] = "nop" 
    end
    j += 1 
end