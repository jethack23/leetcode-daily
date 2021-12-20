# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def __init__(self, head: ListNode):
        """
        @param head The linked list's head.
        Note that the head is guaranteed to be not null, so it contains at least one node.
        """
        self.head = head
        self.cur = head

    def getRandom(self) -> int:
        """
        Returns a random node's value.
        """
        import random

        idx = random.randint(0, 10)
        while idx > 0:
            if self.cur.next is None:
                self.cur = self.head
            else:
                self.cur = self.cur.next
            idx -= 1
        return self.cur.val


# Your Solution object will be instantiated and called as such:
# obj = Solution(head)
# param_1 = obj.getRandom()
