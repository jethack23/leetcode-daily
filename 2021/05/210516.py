# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def minCameraCover(self, root: TreeNode) -> int:
        def dfs(node):
            if node is None:
                return True, False, 0

            lcov, lcam, lret = dfs(node.left)
            rcov, rcam, rret = dfs(node.right)
            ret = lret + rret

            if lcam or rcam:
                covered = True
            else:
                covered = False

            if lcov and rcov:
                camera = False
            else:
                camera = True
                covered = True
                ret += 1

            return covered, camera, ret

        covered, _, ret = dfs(root)
        if not covered:
            ret += 1

        return ret
