;;; hy==1.0a4

(defclass Solution []
  (defn wordPattern [self pattern s]
    (setv p2s (dict)
          s2p (dict)
          s (.split s " "))
    (if (!= (len s) (len pattern)) (return False))
    (for [[i v] (zip pattern s)]
      (if (in i p2s)
          (if (!= v (get p2s i))
              (return False))
          (setv (get p2s i) v))
      (if (in v s2p)
          (if (!= i (get s2p v))
              (return False))
          (setv (get s2p v) i)))
    True))
