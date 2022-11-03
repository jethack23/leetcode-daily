;;; hy==1.0a4

(import collections [Counter])

(defclass Solution []
  (defn longestPalindrome [self words]
    (setv cnt (Counter)
          rst 0)
    (for [w words]
      (setv r (get w (slice None None -1)))
      (if (> (get cnt r) 0)
          (do (+= rst 4)
              (-= (get cnt r) 1))
          (+= (get cnt w) 1)))
    (for [[w c] (cnt.items)]
      (if (and (= (get w 0) (get w 1)) (> c 0))
          (return (+ rst 2))))
    rst))
