(defclass Solution []
  (defn fib [self n]
    (defn sub [n a b]
      (if (= n 0)
          a
          (sub (- n 1) b (+ a b))))
    (sub n 0 1)))

;; hy-ish way. tail call optimized version. But cannot conver to python
(require [hy.contrib.loop [loop]])

(defclass Solution []
  (defn fib [self n]
    (loop [[n n] [a 0] [b 1]]
          (if (= n 0)
              a
              (recur (- n 1) b (+ a b))))))
