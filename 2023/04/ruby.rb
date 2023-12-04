lines = File.open('input.txt').readlines.map(&:chomp)
score = 0

lines.each do |line|
    winning_numbers = line.split(" | ")[0].split(": ")[1].split(" ").map(&:to_i)
    card_numbers = line.split(" | ")[1].split(" ").map(&:to_i)
    card_score = 0 

    card_numbers.each do |num|
        if winning_numbers.include?(num)
            if card_score == 0 
                card_score += 1
            else
                card_score *= 2
            end
        end
    end
    
    score += card_score
end

puts score