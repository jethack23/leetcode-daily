;;; hy==1.0a4

(defclass Solution []
  (defn isUgly [self n]
    (if (< n 1)
        False
        (do (while (= (% n 2) 0)
              (//= n 2))
            (while (= (% n 3) 0)
              (//= n 3))
            (while (= (% n 5) 0)
              (//= n 5))
            (= n 1)))))
