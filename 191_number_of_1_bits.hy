(defclass Solution []
  (defn hammingWeight [self n]
    (setv ret 0)
    (while n
      (+= ret (% n 2))
      (>>= n 1))
    ret))
