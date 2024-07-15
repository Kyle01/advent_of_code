with open('input.txt', 'r') as file:
    str_arr = file.read().split(',')
    orig_nums = [int(x) for x in str_arr]

INPUT_NUM = 8

def find_output(nums, input):
    k = 0 
    while k < len(nums):
        num = nums[k]
        instruction = int(str(num)[-1])
        modes = list(str(num)[0:-2])
        modes.reverse()
        first_mode = int(modes[0]) if len(modes) > 0 else 0
        second_mode = int(modes[1]) if len(modes) > 1 else 0
        third_mode = int(modes[2]) if len(modes) > 2 else 0

        print(k)
        print(nums)

        if instruction == 1:
            first_num = nums[nums[k+1]] if first_mode == 0 else nums[k+1]
            second_num = nums[nums[k+2]] if second_mode == 0 else nums[k+2]
            sum = first_num + second_num
            if third_mode == 0:
                nums[nums[k+3]] = sum
            else:
                nums[k+3] = sum
            k += 4
        if instruction == 2:
            first_num = nums[nums[k+1]] if first_mode == 0 else nums[k+1]
            second_num = nums[nums[k+2]] if second_mode == 0 else nums[k+2]
            product = first_num * second_num
            if third_mode == 0:
                nums[nums[k+3]] = product
            else:
                nums[k+3] = product
            k += 4
        if instruction == 3:
            nums[nums[k+1]] = input
            k += 2
        if instruction == 4:
            print(nums[nums[k+1]])
            k += 2
        if instruction == 5:
            first_num = nums[nums[k+1]] if first_mode == 0 else nums[k+1]
            second_num = nums[nums[k+2]] if second_mode == 0 else nums[k+2]
            if first_num != 0:
                k = second_num
            else:
                k += 3
        if instruction == 6:
            first_num = nums[nums[k+1]] if first_mode == 0 else nums[k+1]
            second_num = nums[nums[k+2]] if second_mode == 0 else nums[k+2]
            if first_num == 0:
                k = second_num
            else:
                k += 3
        if instruction == 7:
            first_num = nums[nums[k+1]] if first_mode == 0 else nums[k+1]
            second_num = nums[nums[k+2]] if second_mode == 0 else nums[k+2]
            third_num = nums[nums[k+3]] if third_mode == 0 else nums[k+3]
            if first_num < second_num:
                nums[third_num] = 1
            else:
                nums[third_num] = 0
            k += 4
        if instruction == 8:
            first_num = nums[nums[k+1]] if first_mode == 0 else nums[k+1]
            second_num = nums[nums[k+2]] if second_mode == 0 else nums[k+2]
            third_num = nums[nums[k+3]] if third_mode == 0 else nums[k+3]
            if first_num == second_num:
                nums[third_num] = 1
            else:
                nums[third_num] = 0
            k += 4
        if (nums[k] == 99):
            k = len(nums) + 1

find_output(orig_nums, INPUT_NUM)
print(orig_nums)