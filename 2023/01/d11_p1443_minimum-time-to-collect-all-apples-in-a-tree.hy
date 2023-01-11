;;; hy==0.25


(defclass Solution []
  (defn minTime [self n edges hasApple]
    (sol n edges hasApple)))

(defn sol [n es ap?]
  (setv g (get-graph es)
        to-visit (set (range n)))
  (defn recur [node]
    (to-visit.remove node)
    (reduce (fn [x y] (+ x y))
            (lfor nn (get g node)
                  :if (in nn to-visit)
                  (calibrate (recur nn) nn))
            0))
  (defn calibrate [x node]
    (if (or (> x 0) (get ap? node))
        (+ x 2)
        x))
  (recur 0))

(defn get-graph [es]
  (setv rst (defaultdict list))
  (for [[f t] es]
    (.append (get rst f) t)
    (.append (get rst t) f))
  rst)


