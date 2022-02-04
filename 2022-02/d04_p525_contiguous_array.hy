;;; hy==1.0a4

(defclass Solution []
  (defn findMaxLength [self nums]
    (setv mem {0 -1}
          cnt 0
          rst 0)
    (for [[i n] (enumerate nums)]
      (if (= n 1)
          (+= cnt 1)
          (-= cnt 1))
      (if (in cnt mem)
          (setv rst (max rst (- i (get mem cnt))))
          (setv (get mem cnt) i)))
    rst))
