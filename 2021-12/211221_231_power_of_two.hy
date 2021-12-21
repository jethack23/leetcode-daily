(defclass Solution []
  (defn isPowerOfTwo [slef n]
    (while (and n (= (% n 2) 0))
      (>>= n 1))
    (= n 1)))
