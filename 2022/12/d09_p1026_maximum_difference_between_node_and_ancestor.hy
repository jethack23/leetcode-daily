;;; hy==0.25

(defclass Solution []
  (defn maxAncestorDiff [self root]
    (sol root)))

(defn sol [n]
  (defn recur [n mi ma]
    (if (is n None)
        0
        (max (path-max-ancestor-diff n.val mi ma)
             (max (lfor nn [n.left n.right]
                        (recur nn (min mi n.val) (max ma n.val)))))))
  (recur n n.val n.val))

(defn path-max-ancestor-diff [cur-val cur-min cur-max]
  (max (abs-diff cur-val cur-min)
       (abs-diff cur-val cur-max)))

(defn abs-diff [a b]
  (abs (- a b)))

