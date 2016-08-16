# https://leetcode.com/problems/minimum-depth-of-binary-tree/
#
# Given a binary tree, find its minimum depth. The minimum depth is the number
# of nodes along the shortest path from the root node down to the nearest leaf
# node.


# Definition for a binary tree node.
# class TreeNode
#   attr_accessor :val, :left, :right
#   def initialize(val)
#     @val = val
#     @left, @right = nil, nil
#   end
# end


# @param {TreeNode} root
# @return {Integer}
def min_depth(root)
  return 0 if root.nil?

  depth, queue = 1, [root, nil]
  while true
    node = queue.shift
    if node.nil?
      depth += 1
      break if queue.empty?
      queue << nil; next
    end

    break unless node.left || node.right
    queue << node.left if node.left
    queue << node.right if node.right
  end

  depth
end
