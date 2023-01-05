;;; hy==0.25

(defclass Solution []
  (defn findMinArrowShots [self points]
    (sol points)))

(defn sol [ps]
  (ps.sort)
  (setv rst 0)
  (while ps
    (+= rst 1)
    (setv [s _] (ps.pop))
    (while (and ps (<= s (get (get ps -1) 1)))
      (ps.pop)))
  rst)
