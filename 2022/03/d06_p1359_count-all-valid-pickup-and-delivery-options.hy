;;; hy==1.0a4

(defclass Solution []
  (defn countOrders [self n]
    (setv rst 1)
    (for [i (range 2 (+ n 1))]
      (*= rst (* i (- (* 2 i) 1)))
      (print rst)
      (%= rst 1_000_000_007))
    rst))
