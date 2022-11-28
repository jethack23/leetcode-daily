;;; hy==1.0a4


;;; Counter

(defclass Solution []
  (defn findWinners [self ms]
    (setv ws (Counter)
          ls (Counter)
          r0 (set)
          r1 (set))
    (for [[w l] ms]
      (+= (get ws w) 1)
      (+= (get ls l) 1))
    (for [[w c] (ws.items)]
      (when (= (get ls w) 0)
        (r0.add w)))
    (for [[l c] (ls.items)]
      (when (= c 0)
        (r0.add l))
      (when (= c 1)
        (r1.add l))) 
    [(sorted r0) (sorted r1)]))

;;; approach 1 in official solution page

(defclass Solution []
  (defn findWinners [self ms]
    (setv r0 (set)
          r1 (set)
          r2 (set))
    (for [[w l] ms]
      (when (not (or (in w r1)
                     (in w r2)))
        (r0.add w))
      (cond [(in l r0) (do (r0.remove l)
                           (r1.add l))]
            [(in l r1) (do (r1.remove l)
                           (r2.add l))]
            [(not (in l r2)) (r1.add l)]))
    [(sorted r0) (sorted r1)]))
