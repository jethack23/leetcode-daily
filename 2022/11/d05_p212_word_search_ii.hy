;;; hy==1.0a4

(defclass Solution []
  (defn findWords [self b ws]
    (setv t {}
          m (len b)
          n (len (get b 0))
          rst [])

    ;; build trie
    (for [w ws]
      (setv cur t)
      (for [c w]
        (when (not (in c cur))
          (setv (get cur c) {}))
        (setv cur (get cur c)))
      (setv (get cur "word") w))

    ;; function for traverse
    (defn search [i j parent]
      (setv c (get (get b i) j)
            cur (get parent c)
            (get (get b i) j) None)
      (when (in "word" cur)
        (rst.append (cur.pop "word")))
      (for [[di dj] [[1 0] [-1 0] [0 1] [0 -1]]]
        (setv ni (+ i di)
              nj (+ j dj))
        (when (and (>= ni 0) (< ni m) (>= nj 0) (< nj n) (in (get (get b ni) nj) cur))
          (search ni nj cur)))
      (setv (get (get b i) j) c)
      (when (not cur) (parent.pop c)) ; the key point I missed
      )

    ;; traverse
    (for [i (range m)]
      (for [j (range n)]
        (when (in (get (get b i) j) t)
          (search i j t))))
    rst))
