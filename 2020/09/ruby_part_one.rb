file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

def preamble(k, input_lines)
    additives = []

    i = 0 
    while i < 25
        additives << input_lines[k+i].to_i
        i += 1 
    end

    additives
end

def has_property(preamble, target_num)
    k = 0
    while k < 24
        j = k + 1
        while j < 25 
            return true if preamble[k] + preamble[j] == target_num
            j += 1
        end
        k += 1 
    end
    false 
end

k = 0 
solution = -1
while k < input_lines.length - 25 
    preamble = preamble(k, input_lines)
    target = input_lines[k+25].to_i
    unless has_property(preamble, target)
        solution = input_lines[k+25]
    end
    k += 1 
end
puts solution