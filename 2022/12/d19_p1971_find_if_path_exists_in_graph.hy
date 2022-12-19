;;; hy==0.25

(import collections [defaultdict deque]
        functools [reduce])

(defclass Solution []
  (defn validPath [self n edges source destination]
    (sol edges source destination)))

(defn sol [edges source destination]
  (setv visited (set)
        edge-dict (edge-list-to-dict edges))
  (defn recur [source destination]
    (if (in source visited)
        False
        (do (visited.add source)
            (if (or (= source destination)
                    (in destination (get edge-dict source)))
                True
                (dfs-call (get edge-dict source) destination)))))
  (defn dfs-call [start-set destination]
    (setv found False
          q (deque start-set))
    (while (and (not found) q)
      (setv found (or found (recur (q.pop) destination))))
    found)
  (recur source destination))

(defn edge-list-to-dict [edges]
  (setv rst (defaultdict set))
  (for [[i j] edges]
    (.add (get rst i) j)
    (.add (get rst j) i))
  rst)
