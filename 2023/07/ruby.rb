lines = File.open('input.txt').readlines.map(&:chomp)

class Hand 
    attr_reader :bid, :hand
    def initialize line
        @bid = line.split(" ")[1].to_i
        @hand = line.split(" ")[0]
    end

    def to_s
        "#{@hand} - #{@bid} - #{card_type}"
    end

    def card_type
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

    def <=>(b)
        card_rank = ['A', 'K', 'Q', 'J', 'T', '9', '8', '7', '6', '5', '4', '3', '2'].reverse
        type_rank = ['fives', 'fours', 'full_house', 'threes', 'two_pair', 'one_pair', 'high_card']

        return type_rank.find_index(b.card_type) - type_rank.find_index(card_type) if b.card_type != card_type

        @hand.split("").each_with_index do |card, i|
            b_card = b.hand[i]
            return card_rank.find_index(card) - card_rank.find_index(b_card) if card != b_card
        end
    end

end

# def sort_cards a, b
#     card_rank = ['A', 'K', 'Q', 'J', 'T', '9', '8', '7', '6', '5', '4', '3', '2']
#     type_rank = ['fives', 'fours', 'full_house', 'threes', 'two_pair', 'one_pair', 'high_card']

#     return type_rank.find_index(b.card_type) - type_rank.find_index(a.card_type) if b.card_type != a.card_type

#     a.hand.split("").each_with_index do |card, i|
#         b_card = b.hand[i]
#         return card_rank.find_index(card) - card_rank.find_index(b_card) if card != b_card
#     end
# end

lines = lines.map{|line| Hand.new(line)}
lines.sort!
answer = 0 
lines.each_with_index do |line, i|
    answer += line.bid * (i + 1)
end
puts answer