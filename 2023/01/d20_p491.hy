(import collections [defaultdict])
(import functools [reduce])

(defclass Solution []
  (defn findSubsequences [self nums]
    (sol nums)))

(defn sol [ns]
  (setv smem (defaultdict set))
  (for [n ns]
    (setv new (set))
    (for [k smem]
      (when (<= k n)
        (for [s (get smem k)]
          (new.add (+ s "," (str n))))))
    (.update (get smem n) new)
    (.add (get smem n) (str n)))
  (list (filter (fn [x] (> (len x) 1))
                (map (fn [x] (list (map int (.split x ","))))
                     (reduce (fn [x y] (| x y)) (smem.values))))))
