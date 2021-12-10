file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

left_operators = ['(', '{', '<', '[']
right_operators = [')', '}', '>', ']']

mapped_value = {
    ')' => 3,
    ']' => 57,
    '}' => 1197,
    '>' => 25137,
}

corrupted_chars = []
lines.each do |line|
    stack = []
    line.split('').each do |char|
        if left_operators.include?(char)
            stack.unshift(char) 
        else 
            recent_left_operator = stack[0]
            if char == ')' && recent_left_operator == '('
                stack.shift
            elsif char == '}' && recent_left_operator == '{'
                stack.shift
            elsif char == '>' && recent_left_operator == '<'
                stack.shift
            elsif char == ']' && recent_left_operator == '['
                stack.shift
            else
                corrupted_chars << char
                break
            end
        end        
    end
end

sum = 0 
corrupted_chars.each do |char|
    sum += mapped_value[char]
end
puts sum