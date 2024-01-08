def solution(root, low, high):
    def dfs(node):
        if node is None:
            return 0
        elif node.val < low:
            return dfs(node.right)
        elif node.val > high:
            return dfs(node.left)
        else:
            return node.val + dfs(node.left) + dfs(node.right)

    return dfs(root)


class Solution:
    def rangeSumBST(self, *args, **kwargs):
        return solution(*args, **kwargs)
