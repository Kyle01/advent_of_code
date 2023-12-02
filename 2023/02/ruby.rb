lines = File.open('input.txt').readlines.map(&:chomp)

MAX_RED = 12
MAX_GREEN = 13 
MAX_BLUE = 14

class Game 
    attr_reader :id

    def initialize line
        @id = line.split(": ")[0].split(' ')[1].to_i
        @possible_red, @possible_blue, @possible_green = 0, 0, 0 

        moves = line.split(": ")[1].gsub(';', ',').split(', ')

        moves.select{|x| x.include?('red')}.each do |move|
            considered_value = move.split(' ')[0].to_i
            @possible_red = considered_value if considered_value > @possible_red
        end

        moves.select{|x| x.include?('blue')}.each do |move|
            considered_value = move.split(' ')[0].to_i
            @possible_blue = considered_value if considered_value > @possible_blue
        end

        moves.select{|x| x.include?('green')}.each do |move|
            considered_value = move.split(' ')[0].to_i
            @possible_green = considered_value if considered_value > @possible_green
        end
    end

    def possible_game? 
        return false if @possible_blue > MAX_BLUE
        return false if @possible_red > MAX_RED
        return false if @possible_green > MAX_GREEN

        true
    end

    def game_power
        @possible_blue * @possible_red * @possible_green
    end

end

solution = 0 
lines.each do |line|
    game = Game.new(line)

    solution += game.game_power
end

puts solution