(defclass Solution []
  (defn closestMeetingNode [self edges node1 node2]
    (sol edges node1 node2)))

(defn sol [edges node1 node2]
  (defn recur [node dist rst visited]
    (when (and (not (get visited node))
               (!= node -1))
      (setv (get visited node) True
            (get rst node) dist)
      (recur (get edges node) (+ dist 1) rst visited))
    rst)
  (setv l (len edges)
        dist1 (recur node1 0 (* [-1] l) (* [False] l))
        dist2 (recur node2 0 (* [-1] l) (* [False] l))
        saved-dist l
        rst -1)
  (for [[i [d1 d2]] (enumerate (zip dist1 dist2))]
    (when (and (!= d1 -1) (!= d2 -1) (< (max d1 d2) saved-dist))
      (setv saved-dist (max d1 d2)
            rst i)))
  rst)
