(import typing *)
(defmacro comment [#* b])

(defmacro assign [s]
  (setv ns (.split s ", "))
  `(do ~@(lfor a ns `(pys ~a))))

(defn kw2args [#** kwargs]
  (.values kwargs))

(defmacro test [s]
  (setv ns (+ "print(sol(*kw2args(" s ")))"))
  `(pys ~ns))

(pys
  "

class Solution:
    def findCheapestPrice(self, n: int, flights: List[List[int]], src: int, dst: int, k: int) -> int:
        return sol(n, flights, src, dst, k)


")

(import collections [defaultdict deque])
(import heapq [heappush heappop])
(import functools [reduce])

(defn get-graph [flights]
  (setv rst (defaultdict list))
  (for [[s d p] flights]
    (.append (get rst s) [d p]))
  rst)

(defn sol [n flights src dst k]
  (setv g (get-graph flights)
        h [[0 src 0]]
        stops (* [n] n))
  (while h
    (setv [cost node stop] (heappop h))
    (cond (= node dst) (return cost)
          (or (< (get stops node) stop) (> stop k)) (continue))
    (setv (get stops node) stop)
    (for [[nn p] (get g node)]
      (heappush h [(+ p cost) nn (+ stop 1)])))
  -1)

(comment
  
  
  
  )
