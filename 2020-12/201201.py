# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def maxDepth(self, root: TreeNode) -> int:
        self.depth = 0
        self.max_depth = 0

        def recur(node):
            if node is None:
                return
            self.depth += 1
            self.max_depth = max(self.max_depth, self.depth)
            if node.left:
                recur(node.left)
            if node.right:
                recur(node.right)
            self.depth -= 1
            return

        recur(root)
        return self.max_depth

