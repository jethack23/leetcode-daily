;;; hy==1.0a4

(defclass Solution []
  (defn minEatingSpeed [self piles h]
    (setv lo 1
          hi (max piles))
    (while (< lo hi)
      (setv m (// (+ lo hi) 2)
            hrs (sum (lfor v piles (+ (// (- v 1) m) 1))))
      (if (> hrs h)
          (setv lo (+ m 1))
          (setv hi m)))
    lo))
