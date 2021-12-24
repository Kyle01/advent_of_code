file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

def create_algorithsm(lines)
    algorithms = []

    algorithm = nil
    lines.each do |line|
        if line.split(' ')[0] == 'inp'
            algorithms << algorithm if algorithm
            algorithm = [line]
        else
            algorithm << line
        end
    end
    algorithms << algorithm
end

def is_valid?(algoirthms, number)
    w, x, y, z = 0, 0, 0, 0
    algoirthms.each do |line|
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
            w = digit
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
                x %= b
            elsif a == 'y'
                y %= b
            elsif a == 'z'
                z %= b 
            end
        elsif operation == 'div'
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
                x = x == b ? 1 : 0
            elsif a == 'z'
                x = x == b ? 1 : 0
            end
        end
    end

    puts "w: #{w}, x: #{x}, y: #{y}, z: #{z}"
    z == 0
end

algorithms = create_algorithsm(lines)
puts is_valid?(algorithms, 13579246899999)