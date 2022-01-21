;;; hy==1.0a4

(defclass Solution []
  (defn canCompleteCircuit [self gas cost]
    (setv current-sum 0
          mval 0
          rst 0)
    (for [i (range (len gas))]
      (+= current-sum (- (get gas i) (get cost i)))
      (if (< current-sum mval)
          (setv mval current-sum
                rst (+ i 1))))
    (if (< current-sum 0)
        -1
        (% rst (len gas)))))
