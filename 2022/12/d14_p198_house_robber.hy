;;; hy==0.25

(defclass Solution []
  (defn rob [self nums]
    (sol nums)))

(defn sol [nums]
  (defn recur [a b]
    (if (not nums)
        b
        (recur b
               (max (+ (nums.pop) a) b))))
  (recur 0 0))
