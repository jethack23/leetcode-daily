class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def partition(self, head: ListNode, x: int) -> ListNode:
        left = ListNode()
        right = ListNode()
        lcur = left
        rcur = right
        while head:
            if head.val < x:
                lcur.next = head
                lcur = lcur.next
            else:
                rcur.next = head
                rcur = rcur.next
            head = head.next
        lcur.next = right.next
        rcur.next = None
        return left.next
