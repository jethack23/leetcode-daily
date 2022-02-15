;;; hy==1.0a4

(import
  functools [cache]
  itertools [accumulate])

(defclass Solution []
  (defn stoneGameII [self piles]
    (setv pfsum (list (accumulate piles :initial 0)))
    #@(cache
        (defn recur [i [m 1] [l (len piles)]]
          (if (>= i l)
              [0 0]
              (max (lfor x (range 1 (min (+ (* 2 m) 1) (+ (- l i) 1)))
                         (lfor [v1 v2] (zip [(- (get pfsum (+ i x))
                                                (get pfsum i))
                                             0]
                                            (reversed (recur (+ i x) (max m x))))
                               (+ v1 v2)))))))
    (get (recur 0) 0)))


(.stoneGameII (Solution) [2 7 9 4 4])
