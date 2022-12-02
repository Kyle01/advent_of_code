lines = File.open('input.txt').readlines.map(&:chomp)

# win is 6, tie is 3, loss is 0 
# rock is 1, paper is 2, scissors is 3
# a, x is rock 
# b, y is paper 
# c, z is scissors


a = "ROCK" 
b = "PAPER"
c = "SCISSORS"

def score_challenge(a, b)
    return 3 if a == 'A' && b == 'X' 
    return 3 if a == 'B' && b == 'Y' 
    return 3 if a == 'C' && b == 'Z' 

    return 6 if a == 'A' && b == 'Y' 
    return 6 if a == 'B' && b == 'Z' 
    return 6 if a == 'C' && b == 'X' 

    0
end

def score_throw move
    return 1 if move === 'X'
    return 2 if move === 'Y'
    
    3
end

def score_round line 
    a, b = line.split(' ')[0], line.split(' ')[1]

    score_throw(b) + score_challenge(a,b)
end

round_score = 0 
lines.each {|line| round_score += score_round(line)}
puts round_score