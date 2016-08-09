# https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
#
# Suppose a sorted array is rotated at some pivot unknown to you beforehand.
#
#     (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
#
# Find the minimum element. You may assume no duplicate exists in the array.


# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  return nums[0] if nums[0] < nums[-1]

  low, high = 0, nums.size-1

  while high - low > 1
    mid = (high + low) / 2
    if nums[mid] < nums[low]
      high = mid
    else
      low = mid
    end
  end

  nums[high]
end
