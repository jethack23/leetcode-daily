;;; hy==1.0a4

(defclass Solution []
  (defn summaryRanges [self nums]
    (if (not nums) (return []))
    (defn format [pair]
      (setv [a b] pair)
      (if (= a b)
          (str a)
          (+ (str a) "->" (str b))))
    (setv rst []
          latest [(get nums 0) (get nums 0)])
    (for [n nums]
      (if (> (- n 1) (get latest -1))
          (do (rst.append latest)
              (setv latest [n n]))
          (setv (get latest -1) n)))
    (rst.append latest)
    (list (map format rst))))
