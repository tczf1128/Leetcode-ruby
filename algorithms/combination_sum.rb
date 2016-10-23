# https://leetcode.com/problems/combination-sum/
#
# Given a set of candidate numbers(C) and a target number(T), find all unique
# combinations in C where the candidate numbers sums to T. The same repeated
# number may be chosen from C unlimited number of times.
#
# Notes:
#
#     + All numbers (including target) will be positive integers.
#     + Elements in a combination (a1, a2, ..., ak) must be in non-descending
#       order. (ie, a1 <= a2 <= ... <= ak).
#     + The solution set must not contain duplicate combinations.
#
# For example, given candidate set {2, 3, 6, 7} and target 7, A solution set
# is:
#
#     [7]
#     [2, 2, 3]


# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  [].tap do |result|
    do_combination(candidates.sort, target, 0, candidates.size - 1, [], result)
  end
end

private

def do_combination(nums, target, lbound, rbound, tracing, result)
  sum = tracing.reduce(0, :+)
  nums[lbound..rbound].each_with_index do |n, i|
    break if sum + n > target
    result << (tracing.dup << n) if sum + n == target
    do_combination(nums, target, lbound + i, rbound, tracing.dup << n, result)
  end
end
