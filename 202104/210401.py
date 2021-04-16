# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def isPalindrome(self, head: ListNode) -> bool:
        n = 0
        cur = head
        while cur:
            n += 1
            cur = cur.next
        
        lcur = head
        head.before = None
        for i in range(n // 2 - 1):
            lcur.next.before = lcur
            lcur = lcur.next
        rcur = lcur.next
        if n % 2 and rcur:
            rcur = rcur.next
        
        while lcur and rcur:
            if lcur.val != rcur.val:
                return False
            lcur = lcur.before
            rcur = rcur.next
        return True