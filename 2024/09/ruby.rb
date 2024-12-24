class DiskSpace
    def initialize(line)
        str = ""
        chars = line.split('')
        chars.each_with_index do |el,i|
            if i % 2 == 0
                el.to_i.times do 
                    str << (i/2).to_s
                end  
            else
                el.to_i.times do 
                    str << "."
                end  
            end
        end
        @disk_layout = str
        k = 0
        @left_most_empty_index = nil
        @right_most_allocated_index = nil
        while k < str.length
            if str[k] == '.'
                @left_most_empty_index = k
                break
            end
            k += 1
        end

        k = str.length-1
        while k >= 0
            if str[k].match?(/[[:digit:]]/)
                @right_most_allocated_index = k
                break
            end
            k -= 1
        end
    end

    def to_s
        @disk_layout
    end

    def fully_optimized?
        @left_most_empty_index > @right_most_allocated_index
    end

    def step_towards_optimized
        @disk_layout[@left_most_empty_index] = @disk_layout[@right_most_allocated_index]
        @disk_layout[@right_most_allocated_index] = '.'
        new_right_index = @right_most_allocated_index - 1
        new_left_index = @left_most_empty_index + 1
        while new_right_index >= 0
            if @disk_layout[new_right_index].match?(/[[:digit:]]/)
                @right_most_allocated_index = new_right_index
                break
            end
            new_right_index -= 1
        end
        @right_most_allocated_index = 0 if new_right_index == 0
        while new_left_index < @disk_layout.length 
            if @disk_layout[new_left_index] == '.'
                @left_most_empty_index = new_left_index
                break
            end
            new_left_index += 1
        end
    end 

    def check_sum
        answer = 0
        @disk_layout.split('').each_with_index do |num, i|
            if num == '.'
                break
            end
            answer += num.to_i * i
        end
        answer
    end
end

line = File.open('input.txt').readlines.map(&:chomp)[0]
disk_space = DiskSpace.new(line)
puts disk_space
until disk_space.fully_optimized?
    disk_space.step_towards_optimized
end
puts disk_space
puts disk_space.check_sum