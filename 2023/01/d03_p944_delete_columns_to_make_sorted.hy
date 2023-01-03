;;; hy==0.25

(defclass Solution []
  (defn minDeletionSize [self strs]
    (sols strs)))

(defn sol [strs]
  (setv rst 0)
  (for [col (zip #* strs)]
    (when (has-invert? col)
      (+= rst 1)))
  rst)

(defn has-invert? [col]
  (for [i (range (- (len col) 1))]
    (when (inverted? col i)
      (return True)))
  False)

(defn inverted? [col i]
  (> (get col i)
     (get col (+ i 1))))
