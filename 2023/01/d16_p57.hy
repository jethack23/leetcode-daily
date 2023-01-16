(import typing *)
(defmacro comment [#* b])

(defn kw2args [#** kwargs]
  (.values kwargs))

(defmacro test [s]
  (setv ns (+ "print(sol(*kw2args(" s ")))"))
  `(pys ~ns))

(import collections [defaultdict
                     deque])

(pys
  "

class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        return sol(intervals, newInterval)
        


")

(defn sol [itvs newi]
  (setv rst []
        itvs (deque itvs))
  (while (and itvs (< (get (get itvs 0) -1) (get newi 0)))
    (rst.append (itvs.popleft)))

  (while (and itvs (overlap? (get itvs 0) newi))
    (setv newi (merge newi (itvs.popleft))))
  (rst.append newi)

  (while itvs
    (rst.append (itvs.popleft)))
  rst
  )

(defn overlap? [i1 i2]
  (setv [xs ys] (list (zip i1 i2)))
  (not (< (min ys) (max xs))))

(defn merge [i1 i2]
  (setv [xs ys] (list (zip i1 i2)))
  [(min xs) (max ys)])

(comment
  
  (overlap? [1 2] [3 4])
  (overlap? [1 3] [2 4])
  (overlap? [1 5] [2 4])
  
  )
