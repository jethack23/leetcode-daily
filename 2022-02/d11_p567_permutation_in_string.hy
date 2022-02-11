;;; hy==1.0a4


(import collections [defaultdict])

(defclass Solution []
  (defn checkInclusion [self s1 s2]
    (setv needs-save (defaultdict int)
          distance-save (len s1)
          pos 0)
    (for [c s1]
      (+= (get needs-save c) 1))
    (setv needs (needs-save.copy)
          distance distance-save)
    (for [[i c] (enumerate s2)]
      (cond
        ;; reset status
        [(not (in c needs)) (do (setv needs (needs-save.copy)
                                      distance distance-save
                                      pos (+ i 1)))]
        ;; rightside keep going
        [(> (get needs c) 0) (do (-= (get needs c) 1)
                                 (-= distance 1)
                                 (if (= distance 0)
                                     (return True)))]
        ;; bring leftside as least as possible
        [True (do (while (!= (get s2 pos) c)
                    (+= distance 1)
                    (+= (get needs (get s2 pos)) 1)
                    (+= pos 1))
                  (+= pos 1))]))
    False))
