;;; hy==1.0a4

(defclass Solution []
  (defn makeGood [self s]
    (defn sign [c]
      (if (.islower c)
          1
          -1))
    (defn bad [a b]
      (and (> 0 (* (sign a) (sign b)))
           (= (.lower a) (.lower b))))
    (setv mem [])
    (for [c s]
      (if (and mem (bad c (get mem -1)))
          (mem.pop)
          (mem.append c)))
    (.join "" mem)))
