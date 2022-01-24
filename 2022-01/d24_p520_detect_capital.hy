;;; hy==1.0a4


(defclass Solution []
  (defn detectCapitalUse [self word]
    (setv cap? (lfor c word (if (<= (ord c) (ord "Z")) 1 0))
          cap-cnt (sum cap?))
    (or (= cap-cnt (len word))
        (= cap-cnt 0)
        (and (= cap-cnt 1) (get cap? 0)))))
