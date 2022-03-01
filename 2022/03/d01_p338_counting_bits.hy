;;; hy==1.0a4

(defclass Solution []
  (defn countBits [self n]
    (setv rst [0 1]
          bound 1)
    (while (<= bound n)
      (<<= bound 1)
      (+= rst (list (map (fn [x] (+ x 1)) rst))))
    (cut rst None (+ n 1))))

(setv examples [2
                5])
(for [e examples]
  (print (.countBits Solution None e)))
