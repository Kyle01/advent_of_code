file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

time = input_lines[0].to_i
nums = input_lines[1].split(',').map(&:to_i)

hash = {}

nums.each do |num|
    next if num == 0

    counter = num
    while counter <= time 
        counter += num 
    end
    hash[num] = counter - time
end
lowest_bus = nil
time_wait = nil 

hash.each do |k, v|
    if time_wait.nil? || v < time_wait
        lowest_bus = k 
        time_wait = v
    end
end
puts lowest_bus * time_wait