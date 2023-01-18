(import typing *)
(defmacro comment [#* b])

(defn kw2args [#** kwargs]
  (.values kwargs))

(defmacro test [s]
  (setv ns (+ "print(sol(*kw2args(" s ")))"))
  `(pys ~ns))

(import collections [deque])
(import heapq [heappush heappop])

(pys
  "

class Solution:
    def maxSubarraySumCircular(self, nums: List[int]) -> int:
        return sol(nums)
        


")

(defn get-psum [nums]
  (setv psum []
        cur 0)
  (for [_ (range 2)]
    (for [n nums]
      (+= cur n)
      (psum.append cur)))
  psum)

(defn sol [nums]
  (setv
    psum (get-psum nums)
    hist [[0 -1]]
    rst (sum nums)
    l (len nums))
  (for [[i s] (enumerate psum)]
    (while (and hist (> (- i (get (get hist 0) 1)) l))
      (heappop hist))
    (setv rst (max rst (- s (get (get hist 0) 0))))
    (heappush hist [s i]))
  rst)

(comment
  
  )
