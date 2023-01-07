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
    (setv min-position (if (< current-gas historical-min)
                           (+ i 1)
                           min-position)
          historical-min (min current-gas historical-min)))
  (if (< current-gas 0)
      -1
      min-position))
