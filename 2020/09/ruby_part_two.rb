file = File.open('input.txt')
input_lines = file.readlines.map(&:chomp)

target_num = 1212510616
additives = []
number_of_additives = 2 
found = false 
k = 0 

while !found
    j = 0
    attempt = 0
    while j < number_of_additives
        additive = input_lines[k+j].to_i
        additives << additive
        attempt += additive
        j += 1 
    end

    if attempt == target_num
        found = true
    else 
        additives = []  
    end
    
    if k + number_of_additives >= input_lines.length
        k = 0 
        number_of_additives += 1 
    else 
        k += 1 
    end
end

puts additives.min + additives.max