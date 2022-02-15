;;; hy==1.0a4


(defn seq-digits-generator [low high]
  (setv digits "123456789")
  (for [l (range 2 10)]
    (for [s (range (- 10 l))]
      (setv n (int (cut digits s (+ s l))))
      (if (<= low n high)
          (yield n)))))

(defclass Solution []
  (defn sequentialDigits [self low high]
    (list (seq-digits-generator low high))))
