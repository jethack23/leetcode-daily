;;; hy==1.0a4

(import random)

(defclass RandomizedSet []
  (defn __init__ [self]
    (setv self.s {}
          self.a []
          self.l -1))

  (defn insert [self val]
    (if (in val self.s)
        False
        (do (self.a.append val)
            (+= self.l 1)
            (setv (get self.s val) self.l)
            True)))

  (defn remove [self val]
    (if (in val self.s)
        (do (setv (get self.a (get self.s val)) (get self.a self.l)
                  (get self.s (get self.a self.l)) (get self.s val))
            (self.a.pop)
            (self.s.pop val)
            (-= self.l 1)
            True)
        False))

  (defn getRandom [self]
    (get self.a (randint 0 self.l))))
