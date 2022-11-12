;;; hy==1.0a4

(defclass MedianFinder []
  (defn __init__ [self]
    (setv self.left []
          self.right []))

  (defn addNum [self num]
    (if (> (len self.right) (len self.left))
        (heappush self.left (- (heappushpop self.right num)))
        (heappush self.right (- (heappushpop self.left (- num))))))

  (defn findMedian [self]
    (if (> (len self.right) (len self.left))
        (get self.right 0)
        (/ (+ (get self.right 0) (- (get self.left 0))) 2))))
