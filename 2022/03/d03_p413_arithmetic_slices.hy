;;; hy==1.0a4


(defclass Solution []
  (defn numberOfArithmeticSlices [self nums]
    (if (< (len nums) 3) (return 0))
    (setv start 0
          last-d (- (get nums 1) (get nums 0))
          last-e (get nums 1)
          rst 0)
    (for [[i v] (enumerate (cut nums 2 (len nums)) :start 2)]
      (if (= last-d (- v last-e))
          (+= rst (max (- (- i start) 1) 0))
          (setv last-d (- v last-e)
                start (- i 1)))
      (setv last-e v))
    rst))
