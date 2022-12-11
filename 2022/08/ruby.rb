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
        
        top = 1 
        bottom = 1 
        right = 1 
        left = 1 

        left_check_index = x-1
        right_check_index = x+1
        top_check_index = y-1
        bottom_check_index = y+1

        left_blocked = false 
        right_blocked = false 
        top_blocked = false 
        bottom_blocked = false

        tree = tree.to_i

        while !left_blocked && left_check_index < 0
            if line[left_check_index].to_i < tree
                left += 1 if left_check_index != x-1
                left_check_index -= 1
            else
                left += 1
                left_blocked = true
            end
        end

        while !right_blocked && right_check_index <= width_index 
            if line[right_check_index].to_i < tree
                right += 1 if right_check_index != x+1
                right_check_index += 1
            else
                right += 1
                right_blocked = true
            end
        end

        while !top_blocked && top_check_index < 0
            if lines[top_check_index].split('')[x].to_i < tree
                top += 1 if top_check_index != y-1
                top_check_index -= 1
            else
                top += 1
                top_blocked = true
            end
        end

        while !bottom_blocked && bottom_check_index <= height_index
            if lines[bottom_check_index].split('')[x].to_i < tree
                bottom += 1 if bottom_check_index != y+1
                bottom_check_index += 1
            else
                bottom += 1
                bottom_blocked = true
            end
        end

        score = top * bottom * left * right 
        puts "L: #{left}, R: #{right}, T: #{top}, B: #{bottom}" 
        puts "X: #{x}, Y: #{y}, score: #{score} \n \n"
        heighest_tree_score = score if score > heighest_tree_score
    end 
end

puts heighest_tree_score