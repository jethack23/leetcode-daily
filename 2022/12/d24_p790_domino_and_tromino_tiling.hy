;;; hy==0.25

(import collections [deque])

(defclass Solution []
  (defn numTilings [self n]
    (% (sol n) 1000000007)))

(defn sol [n]
  (setv domem (deque [1 1])
        trimem (deque [0 0]))
  (for [i (range 1 n)]
    (setv [dn tn] [(+ (get domem -1)
                      (get domem -2)
                      (get trimem -1))
                   (+ (* 2 (get domem -2))
                      (get trimem -1))])
    (domem.append dn)
    (trimem.append tn)
    (domem.popleft)
    (trimem.popleft))
  (domem.pop))
