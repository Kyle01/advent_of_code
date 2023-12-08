lines = File.open('input.txt').readlines.map(&:chomp)

directions = lines[0].split('')

class Instructions 
    attr_reader :key, :left, :right
    def initialize line 
        @key = line.split(" = ")[0]
        @left = line.split(", ")[0].split("(")[1]
        @right = line.split(", ")[1].split(")")[0]
    end

    def to_s
        "#{@key} - L:#{@left} - R:#{@right}"
    end
end

instructions = []
k = 2 
while k < lines.length
    instructions << Instructions.new(lines[k])
    k += 1
end

k = 0 
current_step = instructions[0]
while current_step.key != 'ZZZ'
    direction = directions[k % directions.length]
    next_key = direction == 'R' ? current_step.right : current_step.left
    current_step = instructions.find{|x| x.key == next_key}
    k += 1
end

puts k