;;; hy==1.0a4

(defclass Solution []
  (defn maxProfit [self prices]
    (setv historical-min 10000
          max-profit 0)
    (for [p prices]
      (setv max-profit (max max-profit (- p historical-min))
            historical-min (min historical-min p)))
    max-profit))
