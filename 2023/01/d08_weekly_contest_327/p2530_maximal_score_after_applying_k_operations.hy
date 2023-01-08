(import heapq [heapify heappush heappop])

(defclass Solution []
  (defn maxKelements [self nums k]
    (sol nums k)))

(defn sol [ps k]
  (setv ps (maxheap ps)
        rst 0)
  (for [_ (range k)]
    (+= rst (optimal-operation ps)))
  rst)

(defn maxheap [l]
  (setv rst (lfor x l (- x)))
  (heapify rst)
  rst)

(defn maxheappop [h]
  (- (heappop h)))

(defn maxheappush [h x]
  (heappush h (- x)))

(defn optimal-operation [h]
  (setv n (maxheappop h))
  (maxheappush h (remain n))
  n)

(defn remain [x]
  (+ (// x 3) (if (% x 3) 1 0)))
