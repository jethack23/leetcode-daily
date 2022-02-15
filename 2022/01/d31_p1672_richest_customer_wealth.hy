;;; hy==1.0a4

(defclass Solution []
  (defn maximumWealth [self accounts]
    (max (map sum accounts))))
