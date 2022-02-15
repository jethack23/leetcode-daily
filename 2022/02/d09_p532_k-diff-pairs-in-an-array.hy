;;; hy==1.0a4

(import collections [defaultdict])

(defclass Solution []
  (defn findPairs [self nums k]
    (setv cnt (defaultdict int)
          rst 0)
    (for [n nums]
      (+= (get cnt n) 1))
    (for [n (cnt.keys)]
      (+= rst (cond [(= k 0) (if (> (get cnt n) 1) 1 0)]
                    [(in (+ k n) cnt) 1]
                    [True 0])))
    rst))
