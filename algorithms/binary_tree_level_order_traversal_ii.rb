# https://leetcode.com/problems/binary-tree-level-order-traversal-ii/
#
# Given a binary tree, return the bottom-up level order traversal of its
# nodes' values. (ie, from left to right, level by level from leaf to root).
#
# For example:
#
#     Given binary tree {3, 9, 20, #, #, 15, 7},
#
#           3
#          / \
#         9  20
#            / \
#           15  7
#
#     Return its level order traversal as:
#
#         [
#           [15, 7],
#           [9, 20],
#           [3]
#         ]


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {TreeNode} root
# @return {Integer[][]}
def level_order_bottom(root)
  return [] if root.nil?

  tracing, paths, queue = [], [], [root, nil]
  while true
    node = queue.shift

    if node.nil?
      paths.insert(0, tracing.map(&:val))
      tracing.clear
      break if queue.empty?
      queue << nil; next
    end

    tracing << node
    queue << node.left if node.left
    queue << node.right if node.right
  end

  paths
end
