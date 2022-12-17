;;; hy==0.25

(import collections [deque])

(defclass Solution []
  (defn evalRPN [self rpn]
    (sol rpn)))

(defn sol [rpn]
  (defn recur [q mem]
    (if q
        (recur q (process-token (q.popleft) mem))
        (mem.pop)))
  (recur (deque rpn) []))

(defn process-token [t mem]
  (cond (= t "+") (proc-op (fn [y x] (+ x y)) mem)
        (= t "-") (proc-op (fn [y x] (- x y)) mem)
        (= t "/") (proc-op div mem)
        (= t "*") (proc-op (fn [y x] (* x y)) mem)
        True (mem.append (int t)))
  mem)

(defn div [y x]
  (* (sgn x) (sgn y) (// (abs x) (abs y))))

(defn sgn [x]
  (if (< x 0)
      -1
      1))

(defn proc-op [f mem]
  (mem.append (f (mem.pop) (mem.pop))))
