file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

class BingoBoard 
    def initialize(lines)
        @last_called = -1  
        @board = Array.new(5) { Array.new(5) }
        lines.each_with_index do |line, c|
            line.split(' ').each_with_index do |cell, r|
                @board[c][r] = cell.to_i
            end
        end
    end

    def call_number(number)
        @last_called = number
        @board.each_with_index do |row, c_index|
            row.each_with_index do |cell, i_index|
                if cell == number
                    @board[c_index][i_index] = 'X'
                end
            end
        end
    end
    
    def check_for_bingo
        return true if check_for_bingo_rows || check_for_bingo_columns
        return false
    end

    def calculate_score
        score = 0
        @board.each do |row|
            row.each do |cell|
                score += cell if cell != 'X'
            end
        end
        score * @last_called
    end

    def to_s
        str = "** BINGO BOARD **\n"
        @board.each do |row|
            str += row.join(' ') + "\n"
        end
        if check_for_bingo
            str += "******BINGO******\n"
        else 
            str += "\n"
        end
        str
    end

    private
    def check_for_bingo_rows
        return true if @board.any? { |row| row.all? { |cell| cell == 'X' } }
        false
    end
    
    def check_for_bingo_columns
        return true if @board.transpose.any? { |row| row.all? { |cell| cell == 'X' } }
        false
    end
end

numbers_called = lines[0].split(',').map(&:to_i)

k = 2
boards = []
score = 0 
while k < lines.length
    boards << BingoBoard.new(lines[k..k+5])
    k += 6
end
numbers_called.each do |number|
    boards.each do |board|
        board.call_number(number)
        if board.check_for_bingo
            score = board.calculate_score 
        end
    end
    break if score != 0
end
puts score