;;; hy==1.0a4

(defclass Solution []
  (defn sumRootToLeaf [self root]
    (defn dfs [node path-info]
      (*= path-info 2)
      (+= path-info node.val)
      (if (or node.left node.right)
          (sum (lfor c [node.left node.right] :if c (dfs c path-info)))
          path-info))
    (dfs root 0)))


;; class Solution:

;;     def sumRootToLeaf(self, root):

;;         def dfs(node, path_info):
;;             path_info *= 2
;;             path_info += node.val
;;             return sum([dfs(c, path_info) for c in [node.left, node.right] if c]) if node.left or node.right else path_info
;;         return dfs(root, 0)
