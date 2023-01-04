;;; hy==0.25

(import collections [Counter deque])

(defclass Solution []
  (defn minimumRounds [self tasks]
    (sol tasks)))

(defn sol [ts]
  (min-rnds (.values (Counter ts))))

(defn min-rnds [lst [rst 0]]
  (for [t lst]
    (if (< t 2)
        (return -1)
        (+= rst (rnds t))))
  rst)

(defn rnds [t]
  (+ (// t 3) (if (% t 3) 1 0)))

