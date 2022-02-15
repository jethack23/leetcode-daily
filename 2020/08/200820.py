# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def reorderList(self, head: ListNode) -> None:
        """
        Do not return anything, modify head in-place instead.
        """
        mem = []
        cur = head
        while cur is not None:
            mem.append(cur)
            cur = cur.next
        if len(mem) < 2:
            return
        l = 0
        r = len(mem) - 1
        tog = 1
        while l < r:
            if tog:
                mem[l].next = mem[r]
                l += 1
            else:
                mem[r].next = mem[l]
                r -= 1
            tog ^= 1
        if tog:
            mem[l].next = None
        else:
            mem[r].next = None
