(import [random [randint]])


(defclass Solution []
  (defn __init__ [self head]
    (setv self.head head
          self.cur head
          self.n 0)
    (while self.cur
      (setv self.cur self.cur.next)
      (+= self.n 1))
    (setv self.cur head))

  (defn getRandom [self]
    (for [_ (range (randint 0 self.n))]
      (setv self.cur (if self.cur.next self.cur.next self.head)))
    self.cur.val))
