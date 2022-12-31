;;; hy==0.25

(defclass Solution []
  (defn uniquePathsIII [self g]
    (sol g)))

(defn sol [g]
  (setv visited (lfor row g
                      (lfor x row
                            (if (< x 0) True False)))
        l (sum (lfor row visited (sum (lfor x row (if x 0 1)))))
        rst []
        nrow (len g)
        ncol (len (get g 0)))
  (defn recur [i j path]
    (when (valid? i j)
      (path.append [i j])
      (setv (get (get visited i) j) True)
      (if (= (get (get g i) j) 2)
          (when (= l (len path))
            (rst.append (lfor x path x)))
          (for [[ni nj] (get-next-coords i j)]
            (recur ni nj path)))
      (setv (get (get visited i) j) False)
      (path.pop))
    (len rst))
  (defn valid? [i j]
    (and (<= 0 i) (< i nrow)
         (<= 0 j) (< j ncol)
         (not (get (get visited i) j))))
  (recur #* (get-start-point g) []))

(defn get-start-point [g]
  (for [[i row] (enumerate g)]
    (for [[j x] (enumerate row)]
      (when (= x 1)
        (return [i j])))))

(defn get-next-coords [i j]
  [[(+ i 1) j]
   [(- i 1) j]
   [i (+ j 1)]
   [i (- j 1)]])
