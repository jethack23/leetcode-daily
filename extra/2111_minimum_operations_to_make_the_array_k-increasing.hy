(import [queue [PriorityQueue]])

(defn lis [nums]
  (setv lis [])
  (for [x nums]
    (setv i (bisect_left lis (+ x 1)))
    (if (>= i (len lis))
        (lis.append x)
        (setv (get lis i) x)))
  lis)

(defclass Solution []
  (defn kIncreasing [self arr k]
    (setv n (len arr)
          subseqs (lfor i (range k) (get arr (slice i n k))))
    (sum (lfor seq subseqs (- (len seq) (len (lis seq)))))))
