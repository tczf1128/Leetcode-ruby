# https://leetcode.com/problems/find-peak-element/
#
# A peak element is an element that is greater than its neighbors. Given an
# input array where num[i] != num[i+1], find a peak element and return its
# index. The array may contain multiple peaks, in that case return the index
# to any one of the peaks is fine. You may imagine that
# num[-1] = num[n] = -Inf.
#
# For example, in array [1, 2, 3, 1], 3 is a peak element and your function
# should return the index number 2.
#
# Note:
#
#     Your solution should be in logarithmic complexity.
#
# Credits:
#
#     Special thanks to @ts for adding this problem and creating all test
#     cases.


# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  low, high = 0, nums.size - 1

  while high - low > 1
    mid = (low + high) / 2
    if nums[mid] < nums[mid+1]
      low = mid
    else
      high = mid
    end
  end

  return high if nums[low] < nums[high]
  return low
end
