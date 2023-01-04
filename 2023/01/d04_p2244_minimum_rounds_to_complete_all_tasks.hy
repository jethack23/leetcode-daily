;;; hy==0.25

(import collections [Counter deque])

(defclass Solution []
  (defn minimumRounds [self tasks]
    (sol tasks)))

(defn sol [ts]
  (min-rnds (.values (Counter ts))))

(defn min-rnds [lst]
  (defn recu [q [rst 0]]
    (if (not q)
        rst
        (do (setv fst (q.pop))
            (if (< fst 2)
                -1
                (recu q (+ rst (rnds fst)))))))
  (recu (deque lst)))

(defn rnds [t]
  (+ (// t 3) (if (% t 3) 1 0)))
