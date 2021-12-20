(defclass Solution []
  (defn minimumAbsDifference [self arr]
    (arr.sort)
    (setv n (len arr)
          diffs (lfor i (range 1 n) (- (get arr i) (get arr (- i 1))))
          md (min diffs))
    (lfor (, i d) (enumerate diffs)
          :if (= md d)
          (, (get arr i) (get arr (+ i 1))))))
