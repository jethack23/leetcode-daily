;;; hy==0.25


(import collections [defaultdict deque]
        functools [reduce])


(defclass Solution []
  (defn possibleBipartition [self n dislikes]
    (sol n dislikes)))


(defn sol [n edges]
  (not (find-odd-cycle n edges)))


(defn find-odd-cycle [n edges]
  (setv colors (dict)
        graph (edge-list-to-dict edges))

  (defn recur [node [previous-color True]]
    (if (in node colors)
        (= (get colors node) previous-color)
        (recur-call node (not previous-color))))

  (defn recur-call [node this-color]
    (setv (get colors node) this-color
          found False
          q (deque (get graph node)))
    (while (and q (not found))
      (setv found (or found (recur (q.pop) this-color))))
    found)

  (reduce (fn [x y] (or x y)) (lfor i graph :if (not (in i colors)) (recur i)) False))


(defn edge-list-to-dict [edges]
  (setv rst (defaultdict set))
  (for [[i j] edges]
    (.add (get rst i) j)
    (.add (get rst j) i))
  rst)
