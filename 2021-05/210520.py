from typing import List

# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def levelOrder(self, root: TreeNode) -> List[List[int]]:
        ret = []
        if root is None:
            return ret
        floor = [root]
        while floor:
            ret.append([x.val for x in floor])
            next_floor = []
            for node in floor:
                if not node.left is None:
                    next_floor.append(node.left)
                if not node.right is None:
                    next_floor.append(node.right)
            floor = next_floor
        return ret
