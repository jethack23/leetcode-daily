;;; hy==0.25

(defclass MyQueue []
  (defn __init__ [self]
    (setv self.pushmem []
          self.popmem [])
    None)

  (defn push [self x]
    (when (not self.pushmem)
      (setv self.pushtop x))
    (self.pushmem.append x))

  (defn pop [self]
    (when (not self.popmem)
      (self.popmode))
    (self.popmem.pop))

  (defn peek [self]
    (if self.popmem
        (get self.popmem -1)
        self.pushtop))

  (defn empty [self]
    (not (or self.pushmem
             self.popmem)))

  (defn popmode [self]
    (send-elts self.pushmem self.popmem))

  (defn pushmode [self]
    (send-elts self.popmem self.pushmem)))

(defn send-elts [a b]
  (while a
    (b.append (a.pop))))
