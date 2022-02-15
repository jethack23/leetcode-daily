# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def flatten(self, root: TreeNode) -> None:
        """
        Do not return anything, modify root in-place instead.
        """

        def dfs(cur, last):
            if cur is None:
                return last
            last.right = cur
            last = last.right
            left, right = cur.left, cur.right
            last.left = None
            last = dfs(left, last)
            last = dfs(right, last)
            return last

        dummy = TreeNode()

        dfs(root, dummy)

