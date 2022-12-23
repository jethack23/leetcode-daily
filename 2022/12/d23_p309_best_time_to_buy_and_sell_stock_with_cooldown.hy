;;; hy==0.25

(defclass Solution []
  (defn maxProfit [self prices]
    (sol prices)))


(setv MINIMUM -1000)


(defn sol [prices]
  (setv hold MINIMUM
        sold-1 0
        sold-2 0)
  (for [[d p] (enumerate prices)]
    (setv [sold-2
           sold-1
           hold]
          [sold-1
           (max sold-1 (+ hold p))
           (max hold (- sold-2 p))]))
  sold-1)
