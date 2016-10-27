# https://leetcode.com/problems/insertion-sort-list/
#
# Sort a linked list using insertion sort.


# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end


# @param {ListNode} head
# @return {ListNode}
def insertion_sort_list(head)
  return head if head.nil? || head.next.nil?

  dummy = ListNode.new(0)
  prev, curr, last = dummy, head, head

  while curr
    last = curr.next

    while prev.next && prev.next.val < curr.val
      prev = prev.next
    end

    curr.next = prev.next
    prev.next = curr
    curr = last
    prev = dummy
  end

  dummy.next
end
