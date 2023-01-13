(defclass Solution []
  (defn longestPath [self parents s]
    (sol parents s)))

(defn sol [ps ls]
  (setv g (get-graph ps (len ls)))
  (defn recur [node]
    (setv max-path 0
          paths [])
    (for [c (get g node)]
      (setv [sbtr-max-path sbtr-max-single-path] (recur c)
            max-path (max max-path sbtr-max-path))
      (when (!= (get ls node) (get ls c))
        (paths.append sbtr-max-single-path)))
    (paths.sort)
    (setv longest (if paths (paths.pop) 0)
          second-longest (if paths (paths.pop) 0)
          max-path (max max-path (+ 1 longest second-longest)))
    [max-path (+ 1 longest)])
  (get (recur 0) 0))

(defn get-graph [ps n]
  (setv rst (lfor _ (range n) []))
  (for [[c p] (enumerate ps)]
    (when (>= p 0)
      (.append (get rst p) c)))
  rst)
