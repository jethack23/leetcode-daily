# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def increasingBST(self, root: TreeNode) -> TreeNode:
        def recur(node, ret=None, cur=None):
            if node is None:
                return ret, cur
            if node.left:
                ret, cur = recur(node.left, ret, cur)
            if ret is None:
                ret = TreeNode(node.val)
                cur = ret
            else:
                cur.right = TreeNode(node.val)
                cur = cur.right
            if node.right:
                ret, cur = recur(node.right, ret, cur)
            return ret, cur

        ret, _ = recur(root)
        return ret

