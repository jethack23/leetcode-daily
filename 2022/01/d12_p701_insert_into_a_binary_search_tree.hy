(import typing [Optional])

(pys "class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right")

(defclass Solution []
  (defn ^(get Optional TreeNode) insertIntoBST
    [self ^(get Optional TreeNode) root ^int val]
    (defn insert [node val]
      (if (is node None)
          (TreeNode val)
          (do (if (> val node.val)
                  (setv node.right (insert node.right val))
                  (setv node.left (insert node.left val)))
              node)))
    (insert root val)))

;; class Solution:

;;     def insertIntoBST(self, root: Optional[TreeNode], val: int) -> Optional[TreeNode]:

;;         def insert(node, val):
;;             if node is None:
;;                 _hy_anon_var_5 = TreeNode(val)
;;             else:
;;                 if val > node.val:
;;                     node.right = insert(node.right, val)
;;                     _hy_anon_var_4 = None
;;                 else:
;;                     node.left = insert(node.left, val)
;;                     _hy_anon_var_4 = None
;;                 _hy_anon_var_5 = node
;;             return _hy_anon_var_5
;;         insert(root, val)
;;         return root
