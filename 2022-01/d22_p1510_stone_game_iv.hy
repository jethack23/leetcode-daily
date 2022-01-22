;;; hy==1.0a4

(defclass Solution []
  (defn winnerSquareGame [self n]
    (setv mem (* [False] (+ n 1)))
    (for [[i v] (enumerate mem)]
      (when (not v)
        (setv j 1)
        (while (<= (+ i (* j j)) n)
          (setv (get mem (+ i (* j j))) True)
          (+= j 1))))
    (get mem -1)))
