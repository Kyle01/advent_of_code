def find_start line 
    chars = line[0].split('')

    k = 14
    while k < chars.length
        return k if chars[k-14...k].uniq == chars[k-14...k]

        k += 1 
    end

    k
end

line = File.open('input.txt').readlines.map(&:chomp)
puts find_start(line)