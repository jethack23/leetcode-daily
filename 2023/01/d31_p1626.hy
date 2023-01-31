(import functools [cache])

(defclass Solution []
  (defn bestTeamScore [self scores ages]
    (sol scores ages)))

(defn sol [scores ages]
  (setv dp (* [0] (+ 1 (max ages))))
  (for [[s a] (sorted (zip scores ages))]
    (setv (get dp a) (+ s (max (get dp (slice None (+ a 1)))))))
  (max dp))
