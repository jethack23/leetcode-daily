;;; hy==1.0a4

(defclass StockSpanner []
  (defn __init__ [self]
    (setv self.s []
          self.d 0))

  (defn next [self p]
    (+= self.d 1)
    (while (and self.s
                (<= (get (get self.s -1) 0) p))
      (self.s.pop))
    (setv rst (- self.d (if self.s
                            (get (get self.s -1) 1)
                            0)))
    (self.s.append [p self.d])
    rst))
