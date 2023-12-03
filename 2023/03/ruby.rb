lines = File.open('input.txt').readlines.map(&:chomp)
numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
part_numbers = 0

def num_is_part_number?(input, start_index, end_index, line_number)
    symbols = ["@", "#", "$", "%", "/", "=", "-", "*", "+", "&"]
    confirmed_part = false

    # check line above
    if line_number > 0
        if start_index > 0
            confirmed_part = true if symbols.include?(input[line_number-1][start_index-1])
        end
        k = start_index
        while k < end_index + 1
            confirmed_part = true if symbols.include?(input[line_number-1][k])
            k += 1
        end
        if end_index < input[0].length-1
            confirmed_part = true if symbols.include?(input[line_number-1][end_index+1])
        end
    end

    # check current line 
    if start_index > 0
        confirmed_part = true if symbols.include?(input[line_number][start_index-1])
    end
    if end_index < input[0].length-1
        confirmed_part = true if symbols.include?(input[line_number][end_index+1])
    end

    # check line below 
    if line_number < input.length - 1
        if start_index > 0
            confirmed_part = true if symbols.include?(input[line_number+1][start_index-1])
        end
        k = start_index
        while k < end_index + 1
            confirmed_part = true if symbols.include?(input[line_number+1][k])
            k += 1
        end
        if end_index < input[0].length-1
            confirmed_part = true if symbols.include?(input[line_number+1][end_index+1])
        end
    end
    puts "#{start_index}, #{end_index}, #{line_number}"
    puts confirmed_part

    confirmed_part
end

lines.each_with_index do |line, i|
    k = 0 
    considered_num = []
    while k < line.length 
        if numbers.include?(line[k])
            considered_num << line[k]
        elsif considered_num.length > 0 
            number = considered_num.join().to_i
            puts number 
            part_numbers += number if num_is_part_number?(lines, k-considered_num.length, k-1, i)
            puts 
            considered_num = []
        end

        k += 1
    end
    
    if considered_num.length > 0 
        number = considered_num.join().to_i
        puts number 
        part_numbers += number if num_is_part_number?(lines, k-considered_num.length, k-1, i)
        puts 
    end
end

puts part_numbers