;;; hy==1.0a4

(defclass Solution []
  (defn jobScheduling [self ss es ps]
    (setv js (sorted (list (zip es ss ps)))
          ms [0])
    (for [[i [e s p]] (enumerate js)]
      (setv i (bisect_right js s :hi i :key (fn [x] (get x 0))))
      (ms.append (max (+ p (get ms i)) (get ms -1))))
    (get ms -1)))
