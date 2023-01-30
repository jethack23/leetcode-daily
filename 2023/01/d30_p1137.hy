(defclass Solution []
  (defn tribonacci [self n]
    (setv [a b c] [0 1 1])
    (if (< n 2)
        n
        (do (while (> n 2)
              (setv [a b c] [b c (+ a b c)])
              (-= n 1))
            c))))
