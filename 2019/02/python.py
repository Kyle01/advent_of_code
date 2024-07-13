with open('input.txt', 'r') as file:
    str_arr = file.read().split(',')
    orig_nums = [int(x) for x in str_arr]

def find_output(nums, noun, verb):
    nums[1] = noun
    nums[2] = verb

    k = 0 
    while k < len(nums):
        if (nums[k] == 1):
            first_num = nums[nums[k+1]]
            second_num = nums[nums[k+2]]
            nums[nums[k+3]] = first_num + second_num
            k += 4
        if (nums[k] == 2):
            first_num = nums[nums[k+1]]
            second_num = nums[nums[k+2]]
            nums[nums[k+3]] = first_num * second_num
            k += 4
        if (nums[k] == 99):
            k = len(nums) + 1

    return nums[0]

a = 0
b = 0
num_helper = orig_nums.copy()

while a < 100:
    while b < 100:
        solution = find_output(num_helper, a, b)
        if (solution == 19690720):
            print(a * 100 + b)
            a = 101
            b = 101
        num_helper = orig_nums.copy()
        b += 1
    b = 0
    a += 1