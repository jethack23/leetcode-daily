(defclass Solution []
  (defn kClosest [self points k]
    (defn square-sum [p]
      (sum (map (fn [x] (* x x)) p)))

    (get (sorted points :key (fn [p] (square-sum p))) (slice None k))))
