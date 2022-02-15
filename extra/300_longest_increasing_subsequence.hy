(import [bisect [bisect_left]])

(defn lis [nums]
  (setv lis [])
  (for [x nums]
    (setv i (bisect_left lis x))
    (if (>= i (len lis))
        (lis.append x)
        (setv (get lis i) x)))
  lis)

(defclass Solution []
  (defn lengthOfLIS [self nums]
    (len (lis nums))))
