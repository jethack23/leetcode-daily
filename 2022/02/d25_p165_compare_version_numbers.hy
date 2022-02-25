;;; hy==1.0a4

(defclass Solution []
  (defn compareVersion [self v1 v2]
    (setv convert (fn [x] (list (map int (.split x "."))))
          v1 (convert v1)
          v2 (convert v2)
          changed 1)
    (when (> (len v1) (len v2))
      (setv [v1 v2] [v2 v1]
            changed -1))
    (for [[i1 i2] (zip v1 v2)]
      (cond [(> i1 i2) (return changed)]
            [(< i1 i2) (return (- changed))]))
    (for [i (range (len v1) (len v2))]
      (if (> (get v2 i) 0) (return (- changed))))
    0))
