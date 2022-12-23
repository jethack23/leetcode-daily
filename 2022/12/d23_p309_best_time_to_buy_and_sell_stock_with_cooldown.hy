;;; hy==0.25

(defclass Solution []
  (defn maxProfit [self prices]
    (sol prices)))


(setv MINIMUM (* 5000 (- 1000)))


(defn sol [prices]
  (setv hold []
        sold [])
  (for [[d p] (enumerate prices)]
    (setv sm (if (< d 1)
                 0
                 (max (get sold -1) (+ (get hold -1) p)))
          hm (max (if (< d 1) MINIMUM (get hold -1))
                  (- (if (< d 2) 0 (get sold -2)) p)))
    (hold.append hm)
    (sold.append sm))
  (get sold -1))

(sol [1])
