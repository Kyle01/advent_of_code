lines = File.open('input.txt').readlines.map(&:chomp)

class ReflectionPool
    def initialize lines
        @pool = lines
    end
    
    def reflection 
        direction = 'vertical'

        k = 0 
        while k < @pool[0].length - 1 
            
        end

        direction = 'horizontal'
        ['left', 1]
    end

    def score 
        1 
    end

    def to_s 
        str = ""
        @pool.each {|x| str += x + "\n"}
        str
    end

    private

    def compare_vertical_rows k 
        false 
    end

    def compare_horizontal_rows k 
        false 
    end
end

solution = 0 
current_lines = []
lines.each do |line|
    if line == ""
        pool = ReflectionPool.new(current_lines)
        puts pool
        solution += pool.score
        puts
        current_lines = []
    else 
        current_lines << line
    end
end

pool = ReflectionPool.new(current_lines)
puts pool
solution += pool.score

puts solution