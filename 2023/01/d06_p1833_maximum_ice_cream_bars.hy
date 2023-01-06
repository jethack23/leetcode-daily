;;; hy==0.25

(import bisect [bisect-right])

(defclass Solution []
  (defn maxIceCream [self costs coins]
    (sol costs coins)))

(defn sol [costs coins]
  (costs.sort)
  (setv psum (prefix-sum costs))
  (bisect-right psum coins))

(defn prefix-sum [costs]
  (setv rst []
        cur 0)
  (for [c costs]
    (+= cur c)
    (rst.append cur))
  rst)
