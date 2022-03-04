;;; hy==1.0a4

(defclass Solution []
  (defn champagneTower [self poured row col]
    (setv mem [poured])
    (for [i (range 1 (+ row 1))]
      (setv new-mem (* [0] (+ i 1)))
      (for [j (range i)]
        (setv split (max (/ (- (get mem j) 1) 2) 0))
        (+= (get new-mem j) split)
        (+= (get new-mem (+ j 1)) split))
      (setv mem new-mem))
    (min 1. (get mem col))))
