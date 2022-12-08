;;; hy==0.25

(defclass Solution []
  (defn leafSimilar [self r1 r2]
    (sol r1 r2)))

(defn sol [r1 r2]
  (similar? r1 r2))

(defn similar? [r1 r2]
  (= (leafs r1) (leafs r2)))

(defn leafs [r]
  (setv rst [])
  (defn recur [r]
    (when (not (is r None))
      (when (leaf? r)
        (rst.append r.val))
      (recur r.left)
      (recur r.right)))
  (recur r)
  rst)

(defn leaf? [n]
  (and (is n.left None) (is n.right None)))
