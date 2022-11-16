;;; hy==1.0a4

(defclass Solution []
  (defn guessNumber [self n]
    (setv l 1
          r n)
    (while (< l r)
      (setv m (// (+ l r) 2)
            g (guess m))
      (cond [(= g 0) (return m)]
            [(= g 1) (setv l (+ m 1))]
            [True (setv r (- m 1))]))
    l))
