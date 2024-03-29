# https://leetcode.com/problems/combination-sum-ii/
#
# Given a collection of candidate numbers(C) and a target number(T), find all
# unique combinations in C where the candidate numbers sums to T. Each number
# in C may only be used once in the combination.
#
# Notes:
#
#     + All numbers (including target) will be positive integers.
#     + Elements in a combination (a1, a2, ..., ak) must be in non-descending
#       order. (ie, a1 <= a2 <= ... <= ak).
#     + The solution set must not contain duplicate combinations.
#
# For example, given candidate set {10, 1, 2, 7, 6, 1, 5} and target 8, a
# solution set is:
#
#     [1, 7]
#     [1, 2, 5]
#     [2, 6]
#     [1, 1, 6]


# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum2(candidates, target)
  [].tap do |result|
    do_combination(candidates.sort, target, 0, candidates.size - 1, [], result)
  end.uniq
end

private

def do_combination(nums, target, lbound, rbound, tracing, result)
  sum = tracing.reduce(0, :+)
  nums[lbound..rbound].each_with_index do |n, i|
    break if sum + n > target
    result << (tracing.dup << n) if sum + n == target
    do_combination(nums, target, lbound + i + 1, rbound, tracing.dup << n, result)
  end
end

