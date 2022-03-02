;;; hy==1.0a4

(defclass Solution []
  (defn isSubsequence [self s t]
    (setv i 0
          n (len t))
    (for [c s]
      (while (and (< i n) (!= c (get t i)))
        (+= i 1))
      (+= i 1))
    (<= i n)))
