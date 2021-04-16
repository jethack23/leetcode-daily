(defclass Solution []
  (defn constructArray [self n k]
    (lfor i (range 1 (+ n 1))
          (if (> i (+ k 1)) i
              (% i 2) (+ (// i 2) 1)
              (+ (- k (// i 2)) 2)))))
