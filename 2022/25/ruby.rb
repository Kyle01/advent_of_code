lines = File.open('input.txt').readlines.map(&:chomp)

def parse_symbol(symbol)
    case symbol
    when '2', '1', '0'
        return symbol.to_i
    when '-'
        return -1
    else 
        return -2
    end
end

def power_of_five_value(position)
    helper = []
    max_length = 25 
    max_length.times do |n|
        helper << 5 ** n
    end

    helper[position-1]
end

def nominal(line)
    line_length = line.length

    value = 0 
    line.split('').each_with_index do |char, i|
        position = line_length - i
        value += power_of_five_value(position) * parse_symbol(char)
    end

    value
end


def power_of_five(value)

end

sum = 0 
lines.each {|line| sum += nominal(line)}
puts sum