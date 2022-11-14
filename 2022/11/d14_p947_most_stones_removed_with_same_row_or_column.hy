;;; hy==1.0a4

(defclass Solution []
  (defn removeStones [self ss]
    (setv row-wise (defaultdict set)
          col-wise (defaultdict set)
          rst 0)
    (for [s ss]
      (.add (get row-wise (get s 0)) (get s 1))
      (.add (get col-wise (get s 1)) (get s 0)))
    (defn get-chunk [s [rst 1]]
      (setv r (get s 0)
            c (get s 1))
      (.remove (get row-wise r) c)
      (.remove (get col-wise c) r)
      (while (get row-wise r)
        (setv nc (next (iter (get row-wise r))))
        (+= rst (get-chunk [r nc])))
      (while (get col-wise c)
        (setv nr (next (iter (get col-wise c))))
        (+= rst (get-chunk [nr c])))
      rst)
    (for [[r s] (.items row-wise)]
      (while s
        (+= rst (- (get-chunk [r (next (iter s))]) 1))))
    rst))
