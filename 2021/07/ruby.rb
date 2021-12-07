file = File.open('input.txt')
input = file.readlines.map(&:chomp)[0].split(',').map(&:to_i)

sum = input.reduce(:+)
avg = sum / input.size

move_attemps = Hash.new(0)
attemps = 10
k = 0 

def calculate_move(input, k)
    sum = 0 
    input.each do |i|
        sum += (k - i).abs
    end
    sum 
end

move_attemps[avg] = calculate_move(input, avg)
while k < attemps
  move_attemps[avg + k+1] = calculate_move(input, avg + k+1)
  k += 1
end
k = -attemps
while k < attemps 
  move_attemps[avg + k] = calculate_move(input, avg + k)
  k += 1
end

puts move_attemps.sort_by {|k,v| v}.to_h