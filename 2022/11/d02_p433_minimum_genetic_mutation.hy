;;; hy==1.0a4

(defclass Solution []
  (defn minMutation [self startGene endGene bank]
    (setv b (set bank)
          nq [startGene]
          rst 0)
    (while nq
      (setv q nq
            nq [])
      (for [g q]
        (when (= g endGene)
          (return rst))
        (for [i (range 8)]
          (for [d "ACGT"]
            (when (!= (get g i) d)
              (setv mut (lfor d g d)
                    (get mut i) d
                    mut (.join "" mut))
              (when (in mut b)
                (nq.append mut)
                (b.remove mut))))))
      (+= rst 1))
    -1))
