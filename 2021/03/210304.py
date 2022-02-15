class Solution:
    def getIntersectionNode(self, headA: ListNode, headB: ListNode) -> ListNode:
        a_stack = []
        b_stack = []
        while not headA is None:
            a_stack.append(headA)
            headA = headA.next
        while not headB is None:
            b_stack.append(headB)
            headB = headB.next

        found_common = False
        last_common = None
        while len(a_stack) > 0 and len(b_stack) > 0:
            a_node = a_stack.pop()
            b_node = b_stack.pop()
            if a_node is b_node:
                found_common = True
                last_common = a_node
            else:
                break

        return last_common
