with open('input.txt', 'r') as file:
    str_arr = file.read().split(',')
    nums = [int(x) for x in str_arr]

print(nums)

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

print(nums)
print(k)
