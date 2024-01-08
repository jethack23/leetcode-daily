def solution(root, low, high):
    def dfs(node):
        return (
            0
            if node is None
            else dfs(node.right)
            if node.val < low
            else dfs(node.left)
            if node.val > high
            else node.val + dfs(node.left) + dfs(node.right)
        )

    return dfs(root)


class Solution:
    def rangeSumBST(self, *args, **kwargs):
        return solution(*args, **kwargs)
