(defclass Solution []
  (defn getDescentPeriods [self prices]
    (setv n (len prices)
          l 0
          ret n)
    (for [i (range 1 n)]
      (if (= (get prices i) (- (get prices (- i 1)) 1))
          (+= ret (- i l))
          (setv l i)))
    ret))
