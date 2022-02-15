;;; hy==1.0a4

(defclass Solution []
  (defn singleNumber [self nums]
    (setv rst 0)
    (for [n nums]
      (^= rst n))
    rst))
