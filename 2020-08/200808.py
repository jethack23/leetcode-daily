# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def pathSum(self, root: TreeNode, sum: int) -> int:
        self.ret = 0
        self.mem = [0]
        self.sum = sum
        self.dfs(root)
        return self.ret

    def dfs(self, node):
        if node is None:
            return

        self.mem.append(self.mem[-1] + node.val)
        l = len(self.mem)
        for i in range(l - 1):
            if self.mem[-1] - self.mem[i] == self.sum:
                self.ret += 1
        self.dfs(node.left)
        self.dfs(node.right)
        self.mem.pop()
