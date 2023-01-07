;;; hy==0.25

(defclass Solution []
  (defn canCompleteCircuit [self gas cost]
    (sol gas cost)))

(defn sol [gs cs]
  (setv history (travel-log gs cs))
  (if (< (get history -1) 0)
      -1
      (min-position history)))

(defn travel-log [gs cs]
  (setv cur (- (gs.pop) (cs.pop))
        rst [cur])
  (for [[g c] (zip gs cs)]
    (+= cur g)
    (-= cur c)
    (rst.append cur))
  rst)

(defn min-position [history]
  (min (range (len history)) :key (fn [i] (get history i))))
