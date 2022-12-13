;;; hy==0.25

(defclass Solution []
  (defn minFallingPathSum [self mat]
    (sol mat)))

(setv Mval 100)

(defn sol [mat]
  (setv n (len mat))
  (for [i (range 1 n)]
    (for [j (range n)]
      (+= (get (get mat i) j)
          (min-previous-path-sum (get mat (- i 1)) j n))))
  (min (get mat -1)))


(defn min-previous-path-sum [row j n]
  (min (get row (slice (max 0 (- j 1)) (min n (+ j 2))))))
