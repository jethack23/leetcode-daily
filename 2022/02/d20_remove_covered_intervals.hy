;;; hy==1.0a4


(import bisect [bisect_right])

(defclass Solution []
  (defn removeCoveredIntervals [self intervals]

    (defn contains? [a b]
      "return if a contains b"
      (and (<= (get a 0) (get b 0))
           (<= (get b 1) (get a 1))))

    (setv mem [])
    (for [itv intervals]
      (when (not mem)
        (mem.append itv)
        (continue))
      (setv i (bisect_right mem itv))
      (if (or (and (> i 0) (contains? (get mem (- i 1)) itv))
              (and (< i (len mem)) (contains? (get mem i) itv)))
          (continue))
      (while (and (< i (len mem)) (contains? itv (get mem i)))
        (mem.pop i))
      (while (and (> i 0) (contains? itv (get mem (- i 1))))
        (mem.pop (- i 1))
        (-= i 1))
      (mem.insert i itv))
    (len mem)))

(setv examples [[[1 4] [3 6] [2 8]]
                [[1 4] [2 3]]])

(for [e examples]
  (print (.removeCoveredIntervals (Solution) e)))
