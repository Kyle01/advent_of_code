file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

def find_corrupted_char(line)
    left_operators = ['(', '{', '<', '[']
    
    corrupted_char = nil
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
                corrupted_char = char
                break
            end
        end        
    end
    corrupted_char
end

def find_incomplete_chars(line)
    left_operators = ['(', '{', '<', '[']
    right_operators = [')', '}', '>', ']']

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
            end
        end
    end
    ans = []
    stack.each do |char|
        if char == '('
            ans.push(')')
        elsif char == '{'
            ans.push('}')
        elsif char == '<'
            ans.push('>')
        elsif char == '['
            ans.push(']')
        end
    end
    ans.join('')
end

def corrupted?(line)
    find_corrupted_char(line) != nil
end

def incomplete?(line)
    !corrupted?(line)
end

def get_score(line)
    mapped_value = {
        ')' => 1,
        ']' => 2,
        '}' => 3,
        '>' => 4,
    }

    ans = 0 
    line.split('').each do |char|
        ans *= 5
        ans += mapped_value[char]
    end
    ans
end


scores = []
lines.each do |line|
    if incomplete?(line)
        incomplete_chars = find_incomplete_chars(line)
        score = get_score(incomplete_chars)
        scores << score
    end
end
puts scores.sort[scores.length/2]
