class Solution:
    def buildTree(self, inorder: List[int], postorder: List[int]) -> TreeNode:
        if len(inorder) == 0:
            return None
        root = postorder[-1]
        border = inorder.index(root)

        ret = TreeNode(root)
        ret.left = self.buildTree(inorder[:border], postorder[:border])
        ret.right = self.buildTree(inorder[border + 1 :], postorder[border:-1])

        return ret
