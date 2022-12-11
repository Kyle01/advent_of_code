lines = File.open('input.txt').readlines.map(&:chomp)

width_index = lines[0].length - 1
height_index = lines.length - 1
total_trees = (width_index + 1) * (height_index + 1)

num_hidden = 0 

lines.each_with_index do |line, y|
    puts y
    line.split('').each_with_index do |tree, x|
        next if y == 0
        next if x == 0 
        next if y == width_index
        next if x == height_index

        left_hidden = false
        left_check_index = 0 
        
        right_hidden = false 
        right_check_index = width_index
        
        top_hidden = false
        top_check_index = 0 

        bottom_hidden = false 
        bottom_check_index = height_index
        tree = tree.to_i

        while left_check_index < x 
            left_hidden = true if line[left_check_index].to_i >= tree
            left_check_index += 1
        end

        while right_check_index > x 
            right_hidden = true if line[right_check_index].to_i >= tree
            right_check_index -= 1
        end

        while top_check_index < y
            top_hidden = true if lines[top_check_index].split('')[x].to_i >= tree
            top_check_index += 1
        end

        while bottom_check_index > y
            bottom_hidden = true if lines[bottom_check_index].split('')[x].to_i >= tree
            bottom_check_index -= 1
        end

        num_hidden += 1 if left_hidden && right_hidden && top_hidden && bottom_hidden
    end 
end

puts total_trees - num_hidden