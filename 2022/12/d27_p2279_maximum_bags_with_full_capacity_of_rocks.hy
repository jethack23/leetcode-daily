;;; hy==0.25

(defclass Solution []
  (defn maximumBags [self capacity rocks additionalRocks]
    (sol capacity rocks additionalRocks)))

(defn sol [cs rs adds]
  (cnt-full-bags (vacancy cs rs) adds))

(defn vacancy [cs rs]
  (sorted (lfor [c s] (zip cs rs) (- c s)) :reverse True))

(defn cnt-full-bags [vs adds [cnt 0]]
  (if (or (not vs)
          (< adds (get vs -1)))
      cnt
      (cnt-full-bags vs (- adds (vs.pop)) (+ cnt 1))))
