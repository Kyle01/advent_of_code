
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
        return 0 if count <= 1

        @last - @second_last_spoken 
    end

    def count 
        @count
    end
end

file = File.open('input.txt')
input = file.readlines.map(&:chomp)
nums = input[0].split(',').map(&:to_i)
memory = {}

nums.each_with_index { |num, i| memory[num] = MemorySlot.new(i) }

k = nums.length
while k < 2020
    previous_spoken = nums[k-1]

    if !memory.key?(previous_spoken)
        memory[previous_spoken] = MemorySlot.new(k-1)
    else
        memory[previous_spoken].increment(k-1)
    end

    next_spoken = memory[previous_spoken].next_spoken
    
    nums << next_spoken
    k += 1 
end

puts nums.last