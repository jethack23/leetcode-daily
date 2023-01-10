;;; hy==0.25

(defclass Solution []
  (defn isSameTree [self p q]
    (sol p q)))

(defn sol [p q]
  (defn recur [p q]
    (if (or (is p None)
            (is q None))
        (is p q)
        (and (= p.val q.val)
             (recur p.left q.left)
             (recur p.right q.right))))
  (recur p q))
