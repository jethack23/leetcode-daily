def solution(root1, root2):
    def dfs(node):
        return (
            []
            if node is None
            else [node.val]
            if node.left is None and node.right is None
            else dfs(node.left) + dfs(node.right)
        )

    return dfs(root1) == dfs(root2)


class Solution:
    def leafSimilar(self, *args, **kwargs):
        return solution(*args, **kwargs)
