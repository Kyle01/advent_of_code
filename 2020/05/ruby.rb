file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

def compute_spot(line, range, code)
    bottom_range = 0
    top_range = range
    line.split('').each do |char|
        puts char
        if char == code
            top_range = (top_range - bottom_range) / 2 + bottom_range
        else 
            bottom_range = top_range - (top_range - bottom_range) / 2
        end
        puts "L:#{bottom_range} U:#{top_range}"
    end
    if line[-1] == code
        bottom_range
    else
        top_range
    end
end

def find_seat line
    row = compute_spot(line[0..6], 127, 'F')
    seat = compute_spot(line[7..9], 7, 'L')
    row * 8 + seat 
end

seats = []
input_lines.each do |line|
    seats << find_seat(line)
end
seats.sort!

puts seats.last

solution = -1
k = 1
while k < seats.length - 1
    if seats[k-1] != seats[k] - 1
        solution = seats[k-1]+1
    end
    k += 1
end
puts solution