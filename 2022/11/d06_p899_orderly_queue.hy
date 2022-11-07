;;; hy==1.0a4

;;; it's about mathematical idea.
;;; k = 1 means it has only rotation,
;;; k >= 2 means it has rotation and adjacent transition. thus, any order can be made

(defclass Solution []
  (defn orderlyQueue [self s k]
    (setv l (len s)
          rst s)
    (if (= k 1)
        (do (for [i (range 1 l)]
              (setv rst (min rst (+ (get s (slice i None))
                                    (get s (slice None i))))))
            rst)
        (.join "" (sorted (list s))))))
