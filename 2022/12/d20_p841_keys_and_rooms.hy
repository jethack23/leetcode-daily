;;; hy==0.25

(defclass Solution []
  (defn canVisitAllRooms [self rooms]
    (sol rooms)))

(defn sol [rooms]
  (setv n (len rooms)
        tovisit (set (range n)))
  (defn recur [i]
    (tovisit.remove i)
    (for [k (get rooms i)]
      (when (in k tovisit)
        (recur k))))
  (recur 0)
  (not tovisit))

