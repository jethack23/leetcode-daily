;;; hy==1.0a4
(import collections [defaultdict])

(defclass ExamRoom []
  (defn __init__ [self n]
    (setv self.n n
          self.seats (set)
          self.students 0))
  
  (defn seat [self]
    (+= self.students 1)
    (when (= self.students 1)
      (self.seats.add 0)
      (return 0))
    (setv sorted-seats (sorted (list self.seats)))
    (setv to-take 0
          last-seat (get sorted-seats 0)
          max-dist last-seat)
    (for [[i v] (enumerate sorted-seats :start 1)]
      (setv this-dist (// (- v last-seat) 2))
      (when (< max-dist this-dist)
        (setv to-take (// (+ v last-seat) 2)
              max-dist this-dist))
      (setv last-seat v))
    (setv to-take (if (< max-dist (- (- self.n 1) last-seat))
                      (- self.n 1)
                      to-take))
    (self.seats.add to-take)
    to-take)
  
  
  (defn leave [self p]
    (self.seats.remove p)
    (-= self.students 1)))
