(defclass Solution []
  (defn longestPath [self parents s]
    (sol parents s)))

(defn sol [ps ls]
  (setv g (get-graph ps (len ls))
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

(defn get-graph [ps n]
  (setv rst (lfor _ (range n) []))
  (for [[c p] (enumerate ps)]
    (when (>= p 0)
      (.append (get rst p) c)))
  rst)
