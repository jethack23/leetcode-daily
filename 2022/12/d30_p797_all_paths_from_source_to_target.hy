;;; hy==0.25

(defclass Solution []
  (defn allPathsSourceTarget [self g]
    (sol g)))

(defn sol [g]
  (setv rst [])
  (defn dfs [cur target path]
    (path.append cur)
    (if (= cur target)
        (rst.append (lfor x path x))
        (for [ncur (get g cur)]
          (dfs ncur target path)))
    (path.pop))
  (dfs 0 (- (len g) 1) [])
  rst)
