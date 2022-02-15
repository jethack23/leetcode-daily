;;; hy==1.0a4

(defclass Solution []
  (defn maxDepth [self root]
    (defn dfs [node [rst 0]]
      (if node
          (max (dfs node.left (+ rst 1))
               (dfs node.right (+ rst 1)))
          rst))
    (dfs root)))
