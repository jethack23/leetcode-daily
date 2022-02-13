;;; hy==1.0a4

(defclass Solution []
  
  (defn subsets [self nums]
    (setv rst [[]])
    (for [n nums]
      (+= rst (lfor subset rst (+ subset [n]))))
    rst)
  
  (defn subsets-binary-number-as-filter [self nums]
    (setv rst [[]]
          l (len nums))
    (for [i (range 1 (** 2 l))]
      (setv subset [])
      (for [n nums]
        (if (% i 2)
            (subset.append n))
        (//= i 2))
      (if subset
          (rst.append subset)
          (break)))
    rst))
