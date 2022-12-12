;;; hy==0.25

(defclass Solution []
  (defn climbStairs [self n]
    (sol n)))

(defn sol [n]
  (fib n))

(defn fib [n [a 0] [b 1]]
  (if (= n 0)
      b
      (fib (- n 1) b (+ a b))))
