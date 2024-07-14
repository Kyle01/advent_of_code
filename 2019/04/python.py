# range 284639-748759

LOWER_RANGE = 284639
UPPER_RANGE = 748759

num_possibilities = 0
k = LOWER_RANGE

def has_adjacent_digits(num):
    chars = list(str(num))
    if(chars[0] == chars[1] and chars.count(chars[0]) == 2):
        return True
    if(chars[1] == chars[2] and chars.count(chars[1]) == 2):
        return True
    if(chars[2] == chars[3] and chars.count(chars[2]) == 2):
        return True
    if(chars[3] == chars[4] and chars.count(chars[3]) == 2):
        return True
    if(chars[4] == chars[5] and chars.count(chars[4]) == 2):
        return True
    return False

def digits_never_increase(num):
    helper_arr = list(str(num))
    nums = [int(x) for x in helper_arr]
    if(nums[0] > nums[1]):
        return False
    if(nums[1] > nums[2]):
        return False
    if(nums[2] > nums[3]):
        return False
    if(nums[3] > nums[4]):
        return False
    if(nums[4] > nums[5]):
        return False
        
    return True

while k < UPPER_RANGE:
    if(has_adjacent_digits(k) and digits_never_increase(k)):
        num_possibilities += 1
    k += 1

print(num_possibilities)