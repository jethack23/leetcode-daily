;;; hy==1.0a4

(import
  functools [cache]
  itertools [accumulate])

(defclass Solution []
  (defn stoneGameIII [self piles]
    (setv pfsum (list (accumulate piles :initial 0)))
    #@(cache
        (defn recur [i [l (len piles)]]
          (if (>= i l)
              [0 0]
              (max (lfor x (range 1 (min 4 (+ (- l i) 1)))
                         (lfor [v1 v2] (zip [(- (get pfsum (+ i x))
                                                (get pfsum i))
                                             0]
                                            (reversed (recur (+ i x))))
                               (+ v1 v2)))))))
    (setv [a b] (recur 0))
    (cond [(> a b) "Alice"]
          [(= a b) "Tie"]
          [True "Bob"])))
