;;; hy==0.25

(defclass Solution []
  (defn wordPattern [self pattern s]
    (sol pattern s)))

(defn sol [p s]
  (check-pattern (list p) (s.split) {} (set)))

(defn check-pattern [p s inj range-set]
  (defn recur [p s]
    (cond

      (not p)
      True

      (in (get p -1) inj)
      (if (= (get inj (p.pop)) (s.pop))
          (recur p s)
          False)

      (in (get s -1) range-set)
      False

      True
      (do (mem-update (p.pop) (s.pop))
          (recur p s))))

  (defn mem-update [pe se]
    (inj.update {pe se})
    (range-set.add se))
  
  (if (= (len p) (len s))
      (recur p s)
      False))

