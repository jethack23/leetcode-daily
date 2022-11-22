;;; hy==1.0a4


(import collections [deque])

(defn sol [n]
  (setv sqs (sfor d (range 1 (+ n 1)) :if (<= (* d d) n) (* d d))
        rst 1
        q (deque [0]))
  (while q
    (setv nq (deque))
    (for [c q]
      (for [s sqs]
        (setv nc (+ c s))
        (when (= nc n) (return rst))
        (when (< nc n) (nq.append nc))))
    (+= rst 1)
    (setv q nq)))

(defclass Solution []
  (defn numSquares [self n]
    (sol n)))
