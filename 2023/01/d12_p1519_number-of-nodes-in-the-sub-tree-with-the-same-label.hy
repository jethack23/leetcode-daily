;;; hy==0.25

(import functools [reduce]
        collections [Counter
                     defaultdict])

(defclass Solution []
  (defn countSubTrees [self n edges labels]
    (sol n edges labels)))

(defn sol [n es ls]
  (setv not-visit (* [True] n)
        rst (* [0] n)
        g (get-graph es))
  (defn recur [node]
    (setv (get not-visit node) False)
    (setv cnt (reduce (fn [x y] (+ x y))
                      (lfor nn (get g node) :if (get not-visit nn) (recur nn))
                      (Counter)))
    (+= (get cnt (get ls node)) 1)
    (setv (get rst node) (get cnt (get ls node)))
    cnt)
  (recur 0)
  rst)


(defn get-graph [es]
  (setv rst (defaultdict list))
  (for [[a b] es]
    (.append (get rst a) b)
    (.append (get rst b) a))
  rst)
