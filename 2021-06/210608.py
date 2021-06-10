# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def buildTree(self, preod, inod):
        if len(preod) == 0:
            return None
        this_val = preod[0]
        ind = inod.index(this_val)
        left_inod = inod[:ind]
        right_inod = inod[ind + 1 :]
        left_preod = preod[1 : 1 + ind]
        right_preod = preod[1 + ind :]
        ret = TreeNode(
            this_val,
            self.buildTree(left_preod, left_inod),
            self.buildTree(right_preod, right_inod),
        )
        return ret
