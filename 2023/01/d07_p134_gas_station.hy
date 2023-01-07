;;; hy==0.25

(defclass Solution []
  (defn canCompleteCircuit [self gas cost]
    (sol gas cost)))

(defn sol [gs cs]
  (setv current-gas 0
        historical-min 0
        min-position 0)
  (for [[i [g c]] (enumerate (zip gs cs))]
    (+= current-gas (- g c))
    (when (< current-gas historical-min)
      (setv min-position (+ i 1)
            historical-min current-gas)))
  (if (< current-gas 0)
      -1
      min-position))
