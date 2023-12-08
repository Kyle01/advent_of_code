lines = File.open('input.txt').readlines.map(&:chomp)

class Hand 
    attr_reader :bid, :hand
    def initialize line
        @bid = line.split(" ")[1].to_i
        @hand = line.split(" ")[0]
    end

    def to_s
        "#{@hand} - #{@bid} - #{@hand.include?('J')} - #{card_type}"
    end

    def card_type
        return classic_card_type unless @hand.include?('J')
        classic_type = classic_card_type
        j_count = @hand.split('').count{|x| x == 'J'}

        return 'fives' if j_count == 5
        return 'fives' if j_count == 4

        if j_count == 3 
            return 'fives' if classic_type == 'full_house'
            return 'fours'
        elsif j_count == 2 
            return 'fives' if classic_type == 'full_house'
            return 'fours' if classic_type == 'two_pair'
            return 'threes'
        end

        return 'fives' if classic_type == 'fours'
        return 'fours' if classic_type == 'threes'
        return 'full_house' if classic_type == 'two_pair'
        return 'threes' if classic_type == 'one_pair'
        
        'one_pair'
    end

    def <=>(b)
        card_rank = ['A', 'K', 'Q', 'T', '9', '8', '7', '6', '5', '4', '3', '2', 'J'].reverse
        type_rank = ['fives', 'fours', 'full_house', 'threes', 'two_pair', 'one_pair', 'high_card']

        return type_rank.find_index(b.card_type) - type_rank.find_index(card_type) if b.card_type != card_type

        @hand.split("").each_with_index do |card, i|
            b_card = b.hand[i]
            return card_rank.find_index(card) - card_rank.find_index(b_card) if card != b_card
        end
    end

    private 
    
    def classic_card_type 
        cards = @hand.split('')
        count_arr = []
        cards.each do |card|
            count_arr << cards.count{|x| x == card}
        end

        return 'fives' if count_arr.include?(5)
        return 'fours' if count_arr.include?(4)
        return 'full_house' if count_arr.include?(3) && count_arr.include?(2)
        return 'threes' if count_arr.include?(3)
        return 'two_pair' if count_arr.count{|x| x == 2} == 4
        return 'one_pair'  if count_arr.include?(2)
        'high_card'
    end

end


lines = lines.map{|line| Hand.new(line)}
lines.sort!
answer = 0 
lines.each_with_index do |line, i|
    answer += line.bid * (i + 1)
end
puts answer