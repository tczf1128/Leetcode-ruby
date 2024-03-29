# https://leetcode.com/problems/reverse-linked-list-ii/
#
# Reverse a linked list from position m to n. Do it in-place and in one-pass.
#
# For example:
#
#     Given 1 -> 2 -> 3 -> 4 -> 5 -> NULL, m = 2 and n = 4,
#     return 1 -> 4 -> 3 -> 2 -> 5 -> NULL.
#
# Note:
#
#     Given m, n satisfy the following condition: 1 <= m <= n <= length of
#     list.


# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end


# @param {ListNode} head
# @param {Integer} m
# @param {Integer} n
# @return {ListNode}
def reverse_between(head, m, n)
  dummy = ListNode.new(0).tap { |node| node.next = head }
  curr, prev = head, dummy

  (m - 1).times { prev = curr; curr = curr.next }
  prev_1, curr_1 = prev, curr

  (n - m + 1).times do
    curr_next = curr.next
    curr.next = prev
    prev = curr
    curr = curr_next
  end
  prev_2, curr_2 = prev, curr
  prev_1.next = prev_2
  curr_1.next = curr_2

  dummy.next
end
