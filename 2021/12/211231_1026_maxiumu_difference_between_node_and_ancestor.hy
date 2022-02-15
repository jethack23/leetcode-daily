(defclass Solution []
  (defn maxAncestorDiff [self root]
    (defn dfs [node M m]
      (if node
          (max (lfor c [node.left node.right]
                     (dfs c (max node.val M) (min node.val m))))
          (- M m)))
    (dfs root 0 (** 10 5))))

;; # Definition for a binary tree node.
;; # class TreeNode:
;; #     def __init__(self, val=0, left=None, right=None):
;; #         self.val = val
;; #         self.left = left
;; #         self.right = right

;; class Solution:

;;     def maxAncestorDiff(self, root):

;;         def dfs(node, M, m):
;;             return max([dfs(c, max(node.val, M), min(node.val, m)) for c in [node.left, node.right]]) if node else M - m
;;         return dfs(root, 0, 10 ** 5)
