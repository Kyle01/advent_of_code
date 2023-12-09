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
end

lines.each do |line|
    map = OasisMap.new(line)
    puts map
end