;;; hy==0.25

(defclass Solution []
  (defn canJump [self nums]
    (sol nums)))

(defn sol [nums]
  (setv target (- (len nums) 1))
  (defn recur [q [atmost 0] [i 0]]
    (cond (> i atmost) False
          (>= atmost target) True
          True (recur q (max atmost (+ i (q.popleft))) (+ i 1))))
  (recur (deque nums)))
