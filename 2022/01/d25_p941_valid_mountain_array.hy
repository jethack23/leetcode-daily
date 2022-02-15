;;; hy==1.0a4

(defclass Solution []
  (defn validMountainArray [self arr]
    (setv l (len arr)
          i 1)
    (if (or (< l 3) (> (get arr 0) (get arr 1)) (< (get arr (- l 2)) (get arr (- l 1))))
        (return False))
    (while (and (< i l) (< (get arr (- i 1)) (get arr i)))
      (+= i 1))
    (while (and (< i l) (> (get arr (- i 1)) (get arr i)))
      (+= i 1))
    (= i l)))
