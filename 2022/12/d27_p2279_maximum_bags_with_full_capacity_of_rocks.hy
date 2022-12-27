;;; hy==0.25

(defclass Solution []
  (defn maximumBags [self capacity rocks additionalRocks]
    (sol capacity rocks additionalRocks)))

(defn sol [cs rs adds]
  (setv cnt 0)
  (for [[i r] (enumerate rs)]
    (-= (get cs i) r))
  (cs.sort :reverse True)
  (while (and cs (<= (get cs -1) adds))
    (-= adds (cs.pop))
    (+= cnt 1))
  cnt)
