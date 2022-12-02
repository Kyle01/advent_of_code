lines = File.open('input.txt').readlines.map(&:chomp)

def score_challenge(a, b)
    return 3 if a == 'A' && b == 'A' 
    return 3 if a == 'B' && b == 'B' 
    return 3 if a == 'C' && b == 'C' 

    return 6 if a == 'A' && b == 'B' 
    return 6 if a == 'B' && b == 'C' 
    return 6 if a == 'C' && b == 'A' 

    0
end

def score_throw move
    return 1 if move === 'A'
    return 2 if move === 'B'
    
    3
end

def score_round line 
    a = line.split(' ')[0]
    b = nil

    case line.split(' ')[1]
    when 'X'
        if a == 'A'
            b = 'C'
        elsif a == 'B'
            b = 'A'
        else
            b = 'B'
        end
    when 'Y'
        b = a 
    else
        if a == 'A'
            b = 'B'
        elsif a == 'B'
            b = 'C'
        else
            b = ''
        end
    end

    score_throw(b) + score_challenge(a,b)
end

round_score = 0 
lines.each {|line| round_score += score_round(line)}
puts round_score