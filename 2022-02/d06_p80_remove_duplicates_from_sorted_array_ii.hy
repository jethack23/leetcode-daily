;;; hy==1.0a4

(defclass Solution []
  (defn removeDuplicates [self nums]
    (setv rst (len nums))
    (for [i (range (- (len nums) 1) 1 -1)]
      (when (= (get nums (- i 2)) (get nums i))
        (nums.pop i)
        (-= rst 1)))
    rst))
