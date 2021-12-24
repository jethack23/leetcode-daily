(defclass Solution []
  (defn merge [self intervals]
    (intervals.sort)
    (setv (, s e) (get intervals 0)
          starts [s]
          ends [e])
    (for [(, l r) intervals]
      (if (> l e)
          (do (starts.append l)
              (ends.append r))
          (setv (get ends -1) (max e r)))
      (setv e (get ends -1)))
    (list (zip starts ends))))
