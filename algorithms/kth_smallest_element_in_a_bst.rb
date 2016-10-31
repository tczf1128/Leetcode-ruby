# https://leetcode.com/problems/kth-smallest-element-in-a-bst/
#
# Given a binary search tree, write a function kthSmallest to find the kth
# smallest element in it.
#
# Note:
#
#     You may assume k is always valid, 1 ≤ k ≤ BST's total elements.
#
# Follow up:
#
#     What if the BST is modified (insert/delete operations) often and you
#     need to find the kth smallest frequently? How would you optimize the
#     kthSmallest routine?
#
# Credits:
#
#     Special thanks to @ts for adding this problem and creating all test
#     cases.


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {TreeNode} root
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
  find_kth_smallest(root, k, 0)[1]
end

private
def find_kth_smallest(root, k, count)
  return [count, nil] if root.nil?

  count, val = find_kth_smallest(root.left, k, count)
  return [count, val] if count == k

  count, val = count + 1, root.val
  return [count, val] if count == k

  return find_kth_smallest(root.right, k, count)
end
