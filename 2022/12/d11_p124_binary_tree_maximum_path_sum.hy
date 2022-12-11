;;; hy==0.25

(defclass Solution []
  (defn maxPathSum [self root]
    (sol root)))

(defn sol [root]
  (get (max-path-sum-and-max-onway-sum root) 0))

(defn max-path-sum-and-max-onway-sum [root]
  (if (is root None)
      [-1000 0]
      (calc-target root.val
                   #* (max-path-sum-and-max-onway-sum root.left)
                   #* (max-path-sum-and-max-onway-sum root.right))))

(defn calc-target [val lmax loneway rmax roneway]
  [(max lmax
        rmax
        (+ val loneway roneway))
   (max 0 (+ val (max loneway roneway)))])
