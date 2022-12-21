;;; hy==0.25


(import collections [defaultdict deque]
        functools [reduce])


(defclass Solution []
  (defn possibleBipartition [self n dislikes]
    (sol n dislikes)))


(defn sol [n dislikes]
  (bi-partite? n dislikes))


(defn bi-partite? [n edges]
  (setv colors (dict)
        graph (edge-list-to-dict edges))

  (defn only-even-cycles? [node [color True]]
    (if (in node colors)
        (= (get colors node) color)
        (do (setv (get colors node) color)
            (recur-call-with-early-stopping
              (deque (get graph node)) (not color)))))

  (defn recur-call-with-early-stopping [q color]
    (cond (not q) True
          (not (only-even-cycles? (q.pop) color)) False
          True (recur-call-with-early-stopping q color)))
  (reduce (fn [x y] (and x y)) (lfor i graph :if (not (in i colors)) (only-even-cycles? i)) True))


(defn edge-list-to-dict [edges]
  (setv rst (defaultdict set))
  (for [[i j] edges]
    (.add (get rst i) j)
    (.add (get rst j) i))
  rst)
