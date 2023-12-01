lines = File.open('input.txt').readlines.map(&:chomp)

width_index = lines[0].length - 1
height_index = lines.length - 1
heighest_tree_score = 0 

lines.each_with_index do |line, y|
    line.split('').each_with_index do |tree, x|
        next if y == 0
        next if x == 0 
        next if y == height_index
        next if x == width_index
        
        tree = tree.to_i

        top = 1 
        bottom = 1 
        right = 1 
        left = 1 

        left_check_index = x-2
        right_check_index = x+2
        top_check_index = y-2
        bottom_check_index = y+2

        left_blocked = line[x-1].to_i >= tree 
        right_blocked = line[x+1].to_i >= tree 
        top_blocked = lines[y-1].split('')[x].to_i >= tree 
        bottom_blocked = lines[y+1].split('')[x].to_i >= tree


        while !left_blocked && left_check_index >= 0
            if line[left_check_index].to_i < tree
                left += 1 
                left_check_index -= 1
            else
                left += 1
                left_blocked = true
            end
        end

        while !right_blocked && right_check_index <= width_index 
            if line[right_check_index].to_i < tree
                right += 1 
                right_check_index += 1
            else
                right += 1
                right_blocked = true
            end
        end

        while !top_blocked && top_check_index >= 0
            if lines[top_check_index].split('')[x].to_i < tree
                top += 1 
                top_check_index -= 1
            else
                top += 1
                top_blocked = true
            end
        end

        while !bottom_blocked && bottom_check_index <= height_index
            if lines[bottom_check_index].split('')[x].to_i < tree
                bottom += 1 
                bottom_check_index += 1
            else
                bottom += 1
                bottom_blocked = true
            end
        end

        score = top * bottom * left * right 
        heighest_tree_score = score if score > heighest_tree_score
    end 
end

puts heighest_tree_score