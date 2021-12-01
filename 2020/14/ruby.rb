file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

memory = {}
mask = nil

def convert_num(num, mask)
    target = num.to_s(2)

    while target.length < mask.length
        target.insert(0, "0") 
    end

    mask.split("").each_with_index do |char, i|
        if char != 'X'
            target[i] = char
        end
    end

    target.to_i(2)
end
 
input_lines.each do |line|
    address = nil
    num = nil

    identifer = line.split(" = ")

    if identifer[0] == 'mask'
        mask = identifer[1]
        puts mask
    else
        address = identifer[0].match(/(?<=\[).+?(?=\])/)[0].to_i
        num = identifer[1].to_i

        memory[address] = convert_num(num, mask)
    end

end

solution = 0
memory.each do |_, v|
    solution += v
end

puts solution