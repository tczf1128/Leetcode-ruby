# https://leetcode.com/problems/merge-k-sorted-lists/
#
# Merge k sorted linked lists and return it as one sorted list. Analyze and
# describe its complexity.


# Definition for singly-linked list.
# class ListNode
#   attr_accessor :val, :next
#   def initialize(val)
#     @val = val
#     @next = nil
#   end
# end


# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  merge_lists(lists, 0, lists.size - 1)
end

private

def merge_lists(lists, lbound, ubound)
  return lists[lbound] unless ubound - lbound > 0

  m = (ubound + lbound) / 2
  l = merge_lists(lists, lbound, m)
  r = merge_lists(lists, m + 1, ubound)

  return merge_two_lists(l , r)
end

def merge_two_lists(l1, l2)
  return l1 || l2 unless l1 && l2

  l1, l2 = l2, l1 unless l1.val < l2.val
  l3, l1 = l1, l1.next

  walker = l3
  while l1 && l2
    if l1.val < l2.val
      walker.next = l1
      l1 = l1.next
    else
      walker.next = l2
      l2 = l2.next
    end
    walker = walker.next
  end

  walker.next = l1 || l2
  l3
end
