;;; hy==0.25

(import heapq [heapify heappop heappush])

(defclass Solution []
  (defn minStoneSum [self ps k]
    (sol ps k)))

(defn sol [ps k]
  (setv ps (maxheap ps))
  (for [_ (range k)]
    (optimal-operation ps))
  (- (sum ps)))

(defn maxheap [l]
  (setv rst (lfor x l (- x)))
  (heapify rst)
  rst)

(defn maxheappop [h]
  (- (heappop h)))

(defn maxheappush [h x]
  (heappush h (- x)))

(defn optimal-operation [h]
  (maxheappush h (remain (maxheappop h))))

(defn remain [x]
  (+ (// x 2) (% x 2)))
