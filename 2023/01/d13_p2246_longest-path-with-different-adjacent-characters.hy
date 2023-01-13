(defclass Solution []
  (defn longestPath [self parents s]
    (sol parents s)))

(defn sol [ps ls]
  (setv g (get-graph ps)
        rst 0)
  (defn recur [node]
    (nonlocal rst)
    (setv paths [])
    (for [c (get g node)]
      (if (= (get ls node) (get ls c))
          (recur c)
          (paths.append (recur c))))
    (paths.sort)
    (setv longest (if paths (paths.pop) 0)
          second-longest (if paths (paths.pop) 0)
          rst (max rst (+ 1 longest second-longest)))
    (+ 1 longest))
  (recur 0)
  rst)

(defn get-graph [ps]
  (setv rst (defaultdict list))
  (for [[n p] (enumerate ps)]
    (.append (get rst p) n))
  rst)
