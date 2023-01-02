;;; hy==0.25

(defclass Solution []
  (defn detectCapitalUse [self w]
    (setv ns (lfor c w (if (c.isupper) 1 0))
          ss (sum ns))
    (if (get ns 0)
        (or (= ss 1) (= ss (len ns)))
        (= ss 0))))
