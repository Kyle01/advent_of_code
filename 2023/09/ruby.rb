lines = File.open('input.txt').readlines.map(&:chomp)

class OasisMap 
    def initialize line
        @data = []
        @data << line.split(" ").map(&:to_i)

        until @data[-1].all? {|x| x == 0}
            current_line = @data[-1]
            next_line = []
            k = 1
            while k < current_line.length
                next_line << current_line[k] - current_line[k-1]
                k += 1
            end
            @data << next_line
        end

        k = @data.length - 1
        @data[k].unshift(0)
        k -= 1 
        while k >= 0 
            @data[k].unshift(@data[k][0] - @data[k+1][0])
            k -= 1
        end
    end

    def to_s 
        str = ""
        @data.each_with_index do |line, i|
            i.times {|_| str += " "}
            line.each do |num|
                str += num.to_s
                str += " "
            end
            str += "\n"
        end
        str
    end

    def history_value
        @data[0][0]
    end
end

solution = 0
lines.each do |line|
    map = OasisMap.new(line)
    solution += map.history_value
end

puts solution