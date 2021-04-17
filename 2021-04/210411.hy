(defclass Solution []
  (defn deepestLeavesSum [self root]
    (defn max-depth [node]
      (lif node
           (+ 1 (max (max-depth node.left)
                     (max-depth node.right)))
           0))
    (defn deepest-leaves-sum [node depth max-depth]
      (lif node
           (+ (deepest-leaves-sum node.left (+ depth 1) max-depth)
              (deepest-leaves-sum node.right (+ depth 1) max-depth)
              (if (= depth max-depth)
                  node.val
                  0))
           0))
    (deepest-leaves-sum root 1 (max-depth root))))
