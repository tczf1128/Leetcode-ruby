# https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/
#
# Follow up for "Find Minimum in Rotated Sorted Array":
#
#     What if duplicates are allowed?
#     Would this affect the run-time complexity? How and why?
#
# Suppose a sorted array is rotated at some pivot unknown to you beforehand.
#
#     (i.e., 0 1 2 4 5 6 7 might become 4 5 6 7 0 1 2).
#
# Find the minimum element. The array may contain duplicates.


# @param {Integer[]} nums
# @return {Integer}
def find_min(nums)
  return nums[0] if nums[0] < nums[-1]

  low, high = 0, nums.size - 1
  while high - low > 1
    if nums[low] == nums[high]
      low += 1 while low < high && nums[low] == nums[high] 
      return nums[low] if nums[low] < nums[high]
    end

    mid = (low + high) / 2
    if nums[mid] < nums[low]
      high = mid
    else
      low = mid
    end
  end

  nums[high]
end
