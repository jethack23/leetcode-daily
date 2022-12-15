;;; hy==0.25

(import functools [cache])


(defclass Solution []
  (defn longestCommonSubsequence [self t1 t2]
    (sol t1 t2)))


(defn sol [t1 t2]
  (defn [cache]
    cached [i j]
    (cond
      (or (< i 1)
          (< j 1))
      0

      (= (get t1 (- i 1))
         (get t2 (- j 1)))
      (+ 1 (cached (- i 1) (- j 1)))

      True
      (max (cached (- i 1) j)
           (cached i (- j 1)))))
  (cached (len t1) (len t2)))

