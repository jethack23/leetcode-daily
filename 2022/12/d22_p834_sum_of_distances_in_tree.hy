;;; hy==0.25

(import collections [defaultdict])

(defclass Solution []
  (defn sumOfDistancesInTree [self n edges]
    (sol n edges)))


(defn sol [n edges]
  (defn bottom-up [node]
    (if (get visited node)
        [0 0]
        (do
          (setv (get visited node) True
                from-this-node 0
                n-including-this 1)
          (for [c (get graph node)]
            (setv [f n] (bottom-up c))
            (+= from-this-node (+ f n))
            (+= n-including-this n))
          (setv (get bu-d node) from-this-node
                (get bu-n node) n-including-this)
          [from-this-node n-including-this])))

  
  (defn top-down [node [till-this-node 0] [n-till-this 0]]
    (when (not (get visited node))
      (setv (get visited node) True
            total-d (+ till-this-node (get bu-d node))
            (get rst node) total-d)
      (for [c (get graph node)]
        (setv n-till-c (- n (get bu-n c)))
        (top-down c (- (+ total-d n-till-c) (get bu-d c) (get bu-n c)) n-till-c))))

  (setv graph (edge-list-to-dict edges)
        visited (* [False] n)
        bu-d (* [0] n)
        bu-n (* [0] n))
  (bottom-up 0)

  (setv visited (* [False] n)
        rst (* [0] n))
  (top-down 0)
  
  rst)


(defn edge-list-to-dict [edges]
  (setv rst (defaultdict set))
  (for [[s e] edges]
    (.add (get rst s) e)
    (.add (get rst e) s))
  rst)
