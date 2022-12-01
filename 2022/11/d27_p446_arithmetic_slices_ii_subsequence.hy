;;; hy==1.0a4

(import collections [defaultdict Counter])

(defn sol [ns]
  (setv ss (defaultdict Counter)
        previous (Counter)
        rst 0)
  (for [[i n] (enumerate ns)]
    (for [[k cnt] (.items previous)]
      (setv d (- n k)
            num-new (get (get ss k) d))
      (+= (get (get ss n) d) num-new)
      (+= rst num-new)
      (+= (get (get ss n) d) cnt))
    (+= (get previous n) 1))
  rst)

(defclass Solution []
  (defn numberOfArithmeticSlices [self nums]
    (sol nums)))
