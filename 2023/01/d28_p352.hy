(import bisect [bisect_left])

(defclass SummaryRanges []
  (defn __init__ [self]
    (setv self.mem [])
    None)

  (defn addNum [self value]
    (.insert self.mem (bisect_left self.mem [value value]) [value value]))

  (defn getIntervals [self]
    (setv rst [])
    (for [itv self.mem]
      (if (and rst (<= (get itv 0) (+ (get (get rst -1) -1) 1)))
          (setv (get (get rst -1) -1) (max (get itv -1) (get (get rst -1) -1)))
          (rst.append itv)))
    (setv self.mem rst)
    self.mem))
