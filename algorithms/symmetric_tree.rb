# https://leetcode.com/problems/symmetric-tree/
#
# Given a binary tree, check whether it is a mirror of itself (ie, symmetric
# around its center).
#
# For example:
#
#     this binary tree is symmetric:
#
#             1
#            / \
#           2   2
#          / \ / \
#         3  4 4  3
#
#     But the following is not:
#
#             1
#            / \
#           2   2
#          / \ / \
#            3    3


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  return true if root.nil?
  return is_mirror(root.left, root.right)
end

private
def is_mirror(l, r)
  return true if l.nil? && r.nil?
  return false if l.nil? || r.nil? || l.val != r.val
  return is_mirror(l.left, r.right) && is_mirror(l.right, r.left)
end
