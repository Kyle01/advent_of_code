file = File.open('input.txt')
input = file.readlines.map(&:chomp)

nums = input[0].split(',').map(&:to_i)
memory = Hash.new(0)

class MemorySlot
    def initialize(index)
        @count = 1 
        @last = index
        @second_last = nil 
    end

    def increment(index)
        @count += 1 
        @second_last_spoken = @last
        @last = index 
    end

    def next_spoken 
        @last - @second_last_spoken 
    end

    def count 
        @count
    end
end

nums.each_with_index do |num, i|
    memory[num] = MemorySlot.new(i)
end

k = nums.length
while k < 30000000
    previous_spoken = nums[k-1]

    if !memory.key?(previous_spoken)
        memory[previous_spoken] = MemorySlot.new(k-1)
    else
        memory[previous_spoken].increment(k-1)
    end

    if memory[previous_spoken].count <= 1
        next_spoken = 0 
    else
        next_spoken = memory[previous_spoken].next_spoken
    end
    
    nums << next_spoken
    k += 1 
end

puts nums.last