;;; hy==1.0a4

(defclass Solution []
  (defn exist [self b w]
    (setv m (len b)
          n (len (get b 0))
          bcnt (Counter (sum b (list))))
    (for [[c cnt] (.items (Counter w))]
      (when (> cnt (get bcnt c))
        (return False)))
    (defn valid-pos? [i j]
      (and (<= 0 i (- m 1))
           (<= 0 j (- n 1))))
    (defn search [b w i j]
      (if (= (get (get b i) j) (get w 0))
          (if (= (len w) 1)
              True
              (do (setv (get (get b i) j) ".")
                  (for [[di dj] [[0 1] [1 0] [0 -1] [-1 0]]]
                   (setv ni (+ i di)
                         nj (+ j dj))
                   (when (and (valid-pos? ni nj) (search b (get w (slice 1 None None)) ni nj))
                     (return True)))
                  (setv (get (get b i) j) (get w 0))
                  False))
          False))
    (for [i (range m)]
      (for [j (range n)]
        (when (search b w i j)
          (return True))))
    False))
