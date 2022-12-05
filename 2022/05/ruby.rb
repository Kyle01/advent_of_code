def crates_to_s crates
    str = ""

    crates.each_with_index do |stack, i|
        str += "#{i + 1} - #{stack.join(',')} len: #{stack.size}\n"
    end

    str
end

def move_line input 
    input.index {|line| line.split(' ')[0] == 'move'}
end

def number_of_crates input 
    size_line = move_line(input) - 2
    
    input[size_line].split('').map {|c| c.to_i }.max
end

def compose_starter_crates input 
    crates = []
    number_of_crates = number_of_crates(input)
    number_of_crates.times {|_| crates << []}
    last_box_line = move_line(input) - 3
    line_length = number_of_crates * 4 - 1

    input[0..last_box_line].each do |line|
        chars = line.split('')
        k = 1
        while k < line_length
            crates[k / 4].unshift(chars[k]) if chars[k] && chars[k] != ' '

            k += 4
        end
    end

    crates
end

def moves input 
    move_line = move_line(input)

    input[move_line..-1]
end

def solve_moves input
    crates = compose_starter_crates(input)
    moves = moves(input)

    moves.each do |line|
        num = line.split(' ')[1].to_i
        a = line.split(' ')[3].to_i - 1
        b = line.split(' ')[5].to_i - 1
        
        helper = []
        num.times {|_| helper.unshift(crates[a].pop())}
        crates[b].concat(helper)
    end

    crates
end

def top_crates crates
    ans = []

    crates.each do |crate|
        ans << crate.last
    end

    ans
end

lines = File.open('input.txt').readlines.map(&:chomp)
solution = solve_moves(lines)
puts top_crates(solution).join('')
