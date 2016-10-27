/**
 * https://leetcode.com/problems/insertion-sort-list/
 * Sort a linked list using insertion sort.
 *
 *
 *
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
public class Solution {
	public ListNode insertionSortList(ListNode head) {
		if (head == null || head.next == null) return head;

		ListNode dummy = new ListNode(0);
		ListNode curt = head, prev = dummy, next = head;
		while (curt != null) {
			next = curt.next;

			while (prev.next != null && prev.next.val < curt.val) {
				prev = prev.next;
			}

			curt.next = prev.next;
			prev.next = curt;
			curt = next;
			prev = dummy;
		}

		return dummy.next;
	}
}
