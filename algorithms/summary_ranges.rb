# https://leetcode.com/problems/summary-ranges/
#
# Given a sorted integer array without duplicates, return the summary of its
# ranges.
#
# For example, given [0, 1, 2, 4, 5, 7], return ["0->2", "4->5", "7"].
#
# Credits:
#
#     Special thanks to @jianchao.li.fighter for adding this problem and
#     creating all test cases.


# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
  cursor, ranges = 0, []

  while cursor < nums.size
    ref = cursor
    cursor += 1 while nums[cursor] + 1 == nums[cursor + 1]

    if cursor == ref
      ranges << "#{nums[ref]}"
    else
      ranges << "#{nums[ref]}->#{nums[cursor]}"
    end

    cursor += 1
  end

  ranges
end
