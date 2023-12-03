lines = File.open('input.txt').readlines.map(&:chomp)
STAR_SYMBOL = "*"
gear_ratios = 0

def row_numbers (input, line_number, index)
    numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    nums = []
    return nums if line_number < 0 
    return nums if line_number > input.length - 1

    if (index == 0) 
        if numbers.include?(input[line_number][index]) && numbers.include?(input[line_number][index + 1])
            k = index 
            helper = []
            while numbers.include?(input[line_number][index]) && k <= input[0].length - 1 
                helper << input[line_number][index]
                k += 1
            end
            helper = []
            nums << helper.join.to_i
        elsif numbers.include?(input[line_number][index])
            nums << input[line_number][index].to_i
        end
    elsif (index == input[0].length - 1)
        if numbers.include?(input[line_number][index - 1]) && numbers.include?(input[line_number][index])
            k = index 
            helper = []
            while numbers.include?(input[line_number][index]) && k >= 0
                helper.unshift(input[line_number][index])
                k -= 1
            end
            helper = []
            nums << helper.join.to_i
        elsif numbers.include?(input[line_number][index])
            nums << input[line_number][index].to_i
        end
    else
        if numbers.include?(input[line_number][index])
            if numbers.include?(input[line_number][index - 1]) && numbers.include?(input[line_number][index + 1])
                helper = [input[line_number][index]]
                k = index - 1 
                while numbers.include?(input[line_number][k]) && k >= 0
                    helper.unshift(input[line_number][k])
                    k -= 1 
                end
                k = index + 1
                while numbers.include?(input[line_number][k]) && k <= input[0].length - 1
                    helper << input[line_number][k]
                    k += 1 
                end
                nums << helper.join.to_i
            elsif numbers.include?(input[line_number][index - 1])
                helper = [input[line_number][index]]
                k = index - 1 
                while numbers.include?(input[line_number][k]) && k >= 0
                    helper.unshift(input[line_number][k])
                    k -= 1 
                end
                nums << helper.join.to_i
            elsif numbers.include?(input[line_number][index + 1])
                helper = [input[line_number][index]]
                k = index + 1 
                while numbers.include?(input[line_number][k]) && k <= input[0].length - 1
                    helper << input[line_number][k]
                    k += 1 
                end
                nums << helper.join.to_i
            else
                nums << input[line_number][index].to_i
            end
        elsif numbers.include?(input[line_number][index -1]) && numbers.include?(input[line_number][index + 1])
            helper = [input[line_number][index -1]]
            k = index - 2 
            while numbers.include?(input[line_number][k]) && k >= 0
                helper.unshift(input[line_number][k])
                k -= 1 
            end
            nums << helper.join.to_i

            helper = [input[line_number][index + 1]]
            k = index + 2
            while numbers.include?(input[line_number][k]) && k <= input[0].length - 1
                helper << input[line_number][k]
                k += 1 
            end
            nums << helper.join.to_i
        elsif numbers.include?(input[line_number][index -1])
            helper = [input[line_number][index -1]]
            k = index - 2 
            while numbers.include?(input[line_number][k]) && k >= 0
                helper.unshift(input[line_number][k])
                k -= 1 
            end
            nums << helper.join.to_i
        elsif numbers.include?(input[line_number][index + 1])
            helper = [input[line_number][index + 1]]
            k = index + 2
            while numbers.include?(input[line_number][k]) && k <= input[0].length - 1
                helper << input[line_number][k]
                k += 1 
            end
            nums << helper.join.to_i
        end
    end

    nums
end

def adjacent_numbers(input, line_number, index)
    numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    nums = []

    # get number left 
    if index > 0
        k = index - 1
        num = []
        while numbers.include?(input[line_number][k]) && k >= 0
            num.unshift(input[line_number][k])
            k -= 1
        end

        nums << num.join.to_i if num.length > 0
    end

    # get number right 
    if index < input[0].length - 1
        k = index + 1
        num = []
        while numbers.include?(input[line_number][k]) && k <= input[0].length - 1
            num << input[line_number][k]
            k += 1
        end

        nums << num.join.to_i if num.length > 0
    end

    above_nums = row_numbers(input, line_number - 1, index)
    above_nums.each {|x| nums << x.to_i}

    below_nums = row_numbers(input, line_number + 1, index)
    below_nums.each {|x| nums << x.to_i}

    nums
end

lines.each_with_index do |line, i|
    k = 0 

    while k < line.length 
        if line[k] == STAR_SYMBOL
            adjacent_nums = adjacent_numbers(lines, i, k) 
            gear_ratios += adjacent_nums[0] * adjacent_nums[1] if adjacent_nums.length == 2
        end
        k += 1
    end
end

puts gear_ratios