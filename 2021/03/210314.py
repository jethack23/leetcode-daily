class Solution:
    def swapNodes(self, head: ListNode, k: int) -> ListNode:
        rabbit = head
        turtle = head

        for i in range(k - 1):
            rabbit = rabbit.next

        left = rabbit

        rabbit = rabbit.next

        while rabbit:
            rabbit = rabbit.next
            turtle = turtle.next

        right = turtle

        left.val, right.val = right.val, left.val

        return head
