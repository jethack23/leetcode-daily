(defclass Solution []
  (defclass Solution []
    (defn maximumCount [self nums]
      (sol nums))))

(defn sol [nums]
  (setv pc 0
        nc 0)
  (for [n nums]
    (cond (> n 0) (+= pc 1)
          (< n 0) (+= nc 1)))
  (max pc nc))
