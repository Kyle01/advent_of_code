lines = File.open('input.txt').readlines.map(&:chomp)
score = 0
card_count = Array.new(lines.count, 1)

lines.each_with_index do |line, i|
    puts i + 1
    winning_numbers = line.split(" | ")[0].split(": ")[1].split(" ").map(&:to_i)
    card_numbers = line.split(" | ")[1].split(" ").map(&:to_i)

    card_count[i].times do 
        card_score = 0 
    
        card_numbers.each do |num|
            card_score += 1 if winning_numbers.include?(num)
        end

        k = i + 1
        card_score.times do
            card_count[k] += 1
            k += 1
        end
    end
end

puts card_count.reduce(:+)