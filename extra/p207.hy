(import functools [reduce])

(defclass Solution []
  (defn canFinish [self n prerequisites]
    (sol n prerequisites)))

(defn sol [n prerequisites]
  (setv visited (* [False] n)
        g (get-graph n prerequisites))
  (defn recur [node in-search]
    (cond (in node in-search) False
          (get visited node) True
          True (do (.add in-search node)
                   (setv (get visited node) True
                         rst (reduce (fn [x y] (and x y))
                                     (lfor c (get g node)
                                           (recur c in-search))
                                     True))
                   (.remove in-search node)
                   rst)))
  (reduce (fn [x y] (and x y))
          (lfor i (range n)
                (recur i (set)))
          True))

(defn get-graph [n edges]
  (setv g (lfor i (range n) []))
  (for [[p c] edges]
    (.append (get g c) p))
  g)

(sol 2 [[1 0]])
(sol 2 [[1 0] [0 1]])
