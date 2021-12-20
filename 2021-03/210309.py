class Solution:
    def addOneRow(self, root: TreeNode, v: int, d: int) -> TreeNode:
        if d == 1:
            return TreeNode(val=v, left=root)

        def dfs(node, depth=1):
            if node is None:
                return
            elif depth == d - 1:
                node.left = TreeNode(val=v, left=node.left)
                node.right = TreeNode(val=v, right=node.right)
            else:
                dfs(node.left, depth=depth + 1)
                dfs(node.right, depth=depth + 1)

        dfs(root)

        return root
