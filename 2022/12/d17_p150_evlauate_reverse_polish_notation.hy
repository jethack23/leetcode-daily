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

  (setv ops {"+" (fn [y x] (+ x y))
             "-" (fn [y x] (- x y))
             "/" div
             "*" (fn [y x] (* x y))})
  (defn process-token [t mem]
    (if (in t ops)
        (proc-op (get ops t) mem)
        (mem.append (int t)))
    mem)
  
  (recur (deque rpn) []))

(defn div [y x]
  (* (sgn x) (sgn y) (// (abs x) (abs y))))

(defn sgn [x]
  (if (< x 0)
      -1
      1))

(defn proc-op [f mem]
  (mem.append (f (mem.pop) (mem.pop))))
