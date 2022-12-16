;;; hy==0.25

(defclass MyQueue []
  (defn __init__ [self]
    (setv self.pushmem []
          self.popmem [])
    None)

  (defn push [self x]
    (self.pushmode)
    (self.pushmem.append x))

  (defn pop [self]
    (self.popmode)
    (self.popmem.pop))

  (defn peek [self]
    (self.popmode)
    (get self.popmem -1))

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
