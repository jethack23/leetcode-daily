(defclass Solution []
  (defn rob [self nums]
    (setv n (len nums))
    (defn sol-for-seq [seq]
      (setv n (len seq))
      (setv dp (* [0] n)
            (get dp 0) (get seq 0)
            (get dp 1) (max (get seq (slice 0 2))))
      (for [i (range 2 n)]
        (setv (get dp i) (max (+ (get seq i)
                                 (get dp (- i 2)))
                              (get dp (- i 1)))))
      (get dp -1))
    (if (< n 4)
        (max nums)
        (max (sol-for-seq (get nums (slice 1 None)))
             (sol-for-seq (get nums (slice None (- n 1))))))))
