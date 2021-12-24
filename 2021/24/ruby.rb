file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

def is_valid?(lines, number)
    w, x, y, z = 0, 0, 0, 0
    
    k = 0
    lines.each do |line|
        operation = line.split(' ')[0]
        a = line.split(' ')[1]
        b = line.split(' ')[2]

        if b =='w'
            b = w
        elsif b == 'x'
            b = x
        elsif b == 'y'
            b = y
        elsif b == 'z'
            b = z
        else 
            b = b.to_i
        end

        if operation == 'inp'
            w = number.to_s[k].to_i
            k += 1
        elsif operation == 'add'
            if a == 'x'
                x += b
            elsif a == 'y'
                y += b
            elsif a == 'z'
                z += b 
            end
        elsif operation == 'mul'
            if a == 'x'
                x += b
            elsif a == 'y'
                y += b
            elsif a == 'z'
                z += b 
            end
        elsif operation == 'mod'
            if a == 'x'
                if x < 0 || b <= 0 
                    skip
                end
                x %= b
            elsif a == 'y'
                if y < 0 || b <= 0 
                    skip
                end
                y %= b
            elsif a == 'z'
                if z < 0 || b <= 0 
                    skip
                end
                z %= b 
            end
        elsif operation == 'div'
            if b == 0
                next
            end
            if a == 'x'
                x /= b
            elsif a == 'y'
                y /= b
            elsif a == 'z'
                z /= b 
            end
        elsif operation == 'eql'
            if a == 'x'
                x = x == b ? 1 : 0
            elsif a == 'y'
                y = x == b ? 1 : 0
            elsif a == 'z'
                z = x == b ? 1 : 0
            end
        end
    end

    puts "w: #{w}, x: #{x}, y: #{y}, z: #{z}"
    z == 0
end

k = 99999999999999
# while k >= 11111111111111
#     if is_valid?(lines, k)
#         puts k
#         break
#     end
#     k -= 1
# end
puts is_valid?(lines, 1)