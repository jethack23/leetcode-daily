;;; hy==1.0a4

(defclass Solution []
  (defn removeDuplicates [self ns]
    (setv p 0)
    (for [[i n] (enumerate (get ns (slice 1 None)) 1)]
      (when (!= n (get ns p))
        (+= p 1)
        (setv (get ns p) n)))
    (+ p 1)))
