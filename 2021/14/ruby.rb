file = File.open('input.txt')
lines = file.readlines.map(&:chomp)

sequence = lines[0].split('')
decode = Hash.new
k = 2 
while k < lines.length
    key = lines[k].split(' -> ')[0]
    value = lines[k].split(' -> ')[1]
    decode[key] = value
    k += 1
end

def grow_sequence(sequence, decode)
    k = 0 
    growth = []
    while k < sequence.length
        key = sequence[k..k+1].join('')
        growth << decode[key]
        k += 1
    end
    new_sequence  = []
    k = 0 
    while k < sequence.length
        new_sequence << sequence[k] if sequence[k]
        new_sequence << growth[k] if growth[k]
        k += 1
    end
    new_sequence
end

def sequence_solution(sequence)
    counter_map = Hash.new(0)
    k = 0 
    while k < sequence.length
        counter_map[sequence[k]] = counter_map[sequence[k]] + 1
        k += 1
    end
    counter_map.values.max - counter_map.values.min
end

k = 0 
puts sequence.join('')
while k < 40
    sequence = grow_sequence(sequence, decode)
    k += 1
    puts "After #{k} secret value: #{sequence_solution(sequence)}"
end