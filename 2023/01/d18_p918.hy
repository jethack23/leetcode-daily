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
  (for [n nums]
    (+= cur n)
    (psum.append cur))
  psum)

(defn sol [nums]
  (setv psum (get-psum nums)
        total (get psum -1)
        curmin 0
        curmax (get psum 0)
        rst curmax)
  (for [s psum]
    (setv rst (max rst
                   (- s curmin)
                   (+ curmax (- total s)))
          curmin (min curmin s)
          curmax (max curmax s)))
  rst)

(comment

  (setv nums [-3 -2 -3])
  (setv nums [5 -3 5])

  (sol nums)
  (get-psum nums)

  )
