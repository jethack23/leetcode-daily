;;; hy==1.0a4

(defclass Solution []
  (defn findBall [self g]
    (setv m (len g)
          n (len (get g 0))
          bs (list (range n)))
    (for [r g]
      (for [i (range n)]
        (setv b (get bs i)
              nb (+ b (get r b))
              (get bs i) (if (and (>= b 0)
                                  (<= 0 nb)
                                  (< nb n)
                                  (= (get r b)
                                     (get r nb)))
                             nb
                             -1))))
    bs))
