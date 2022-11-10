;;; hy==1.0a4

(defclass Solution []
  (defn removeDuplicates [self s]
    (setv rst [])
    (for [c s]
      (cond [(not rst) (rst.append c)]
            [(= (get rst -1) c) (rst.pop)]
            [True (rst.append c)]))
    (.join "" rst)))
