# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def zigzagLevelOrder(self, root: TreeNode) -> List[List[int]]:
        self.depth = -1
        self.ret = []

        self.dfs(root)

        for i in range(len(self.ret)):
            if i % 2 == 1:
                self.ret[i] = self.ret[i][::-1]

        return self.ret

    def dfs(self, node):
        if node is None:
            return
        self.depth += 1
        if len(self.ret) <= self.depth:
            self.ret.append([])
        self.ret[self.depth].append(node.val)
        self.dfs(node.left)
        self.dfs(node.right)
        self.depth -= 1
