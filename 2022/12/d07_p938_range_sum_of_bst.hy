;;; hy==1.0a4

(defclass Solution []
  (defn rangeSumBST [self root lo hi]
    (sol root lo hi)))

(defn sol [root lo hi]
  (cond [(is root None) 0]
        [(< root.val lo) (sol root.right lo hi)]
        [(> root.val hi) (sol root.left lo hi)]
        [True (+ root.val (sol root.left lo hi) (sol root.right lo hi))]))
