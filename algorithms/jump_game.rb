# https://leetcode.com/problems/jump-game/
#
# Given an array of non-negative integers, you are initially positioned at the
# first index of the array. Each element in the array represents your maximum
# jump length at that position. Determine if you are able to reach the last
# index.
#
# For example:
#
#     A = [2, 3, 1, 1, 4], return true.
#     A = [3, 2, 1, 0, 4], return false.


# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  max, submax = 0, 0
  low, high = 0, nums.size - 1

  while low <= high && low <= max
    submax = low + nums[low]
    max = submax if submax > max
    return true if max >= high

    low += 1
  end

  max >= high
end
