(defclass Solution []
  (defn findTheDifference [self s t]
    (setv rst 0)
    (for [c (+ s t)]
      (^= rst (ord c)))
    (chr rst)))
