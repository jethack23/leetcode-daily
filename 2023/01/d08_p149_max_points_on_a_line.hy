;;; hy==0.25

(import collections [defaultdict])

(defclass Solution []
  (defn maxPoints [self points]
    (sol points)))

(defn sol [ps]
  (if (= (len ps) 1)
      1
      (do
        (setv rst 0)
        (for [[i [x1 y1]] (enumerate ps)]
          (setv cnt (defaultdict (fn [] 1)))
          (for [[j [x2 y2]] (enumerate ps)]
            (when (!= i j)
              (+= (get cnt (slope x1 y1 x2 y2)) 1)))
          (setv rst (max rst (max (cnt.values)))))
        rst)))

(defn slope [x1 y1 x2 y2]
  (setv dx (- x2 x1)
        dy (- y2 y1))
  (if (= dx 0)
      "vertical"
      (/ dy dx)))
