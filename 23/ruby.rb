test_file = File.open('test.txt')
file = File.open('input.txt')
nums = test_file.readlines.map(&:chomp)[0].split('').map(&:to_i)

def determine_pick_up(nums, i)
    [nums[i+1], nums[i+2], nums[i+3]]
end

def adjust_nums(nums, i)
    nums.delete_at(i)
    nums.delete_at(i)
    nums.delete_at(i)
    nums
end

def determine_destination(nums, pick_up, i)
    target_num = nums[i]-1
    max = nums.max
    min = nums.min
    while pick_up.include?(target_num)
        target_num -= 1 
        
        target_num = max if target_num < min 
    end
    target_num
end

def insert_cups(nums, pick_up, desination_index)
    count = pick_up.length 
    puts nums.join('-')
    nums.insert(desination_index+1, *pick_up)
end

def make_moves(nums, moves, i = 0)
    printer = "-- move #{i+1} --\n"
    printer += "cups:"
    nums.each_with_index do |num, j|
        if j == i
            printer += " (#{num})"
        else
            printer += " #{num}"
        end
    end

    pick_up = determine_pick_up(nums, i)
    printer += "\npick up: #{pick_up.join(", ")}"

    adjust_nums = adjust_nums(nums, i+1)
    puts adjust_nums.join(',')
    destination = determine_destination(nums, pick_up, i)
    
    destination_index = adjust_nums.find_index(destination)
    nums = insert_cups(nums, pick_up, destination_index)

    printer += "\ndestination: #{destination}"
    puts printer
    puts

    if moves > 1
        make_moves(nums, moves-1, i+1)
    end
end

make_moves(nums, 5)