;;; hy==1.0a4

(defclass Solution []
  (defn addDigits [self num]
    (while (>= num 10)
      (setv num (+ (// num 10) (% num 10))))
    num))
