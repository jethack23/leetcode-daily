# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution(object):
    def sortedListToBST(self, head):
        """
        :type head: ListNode
        :rtype: TreeNode
        """
        if head is None:
            return None
        faster = head
        current = head
        for _ in range(2):
            if (faster := faster.next) is None:
                break
        while faster is not None:
            if (faster := faster.next) is None:
                break
            if (faster := faster.next) is None:
                break
            current = current.next
        mid = current.next
        if mid is None:
            return TreeNode(head.val)
        current.next = None
        ret = TreeNode(mid.val)
        ret.left = self.sortedListToBST(head)
        ret.right = self.sortedListToBST(mid.next)
        return ret
