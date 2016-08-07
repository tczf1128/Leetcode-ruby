# https://leetcode.com/problems/two-sum/
#
# Given an array of integers, return indices of the two numbers
# such that they add up to a specific target.
#
# Example:
#     Given nums = [2, 7, 11, 15], target = 9,
#
#     Because nums[0] + nums[1] = 2 + 7 = 9,
#     return [0, 1].
#
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  map = {}

  nums.each_with_index do |num, idx|
    i = map[target - num]
    return [i, idx] if i
    map[num] = idx
  end
end
