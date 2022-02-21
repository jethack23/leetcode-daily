;;; hy==1.0a4

(defclass Solution []
  (defn majorityElement [self nums]
    (setv cnt 0
          rst None)
    (for [n nums]
      (if (= cnt 0)
          (setv rst n))
      (+= cnt (if (= n rst) 1 -1)))
    rst))
