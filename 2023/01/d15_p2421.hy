(import typing *)
(defmacro comment [#* b])

(defn kw2args [#** kwargs]
  (.values kwargs))

(defmacro test [s]
  (setv ns (+ "print(sol(*kw2args(" s ")))"))
  `(pys ~ns))

(import collections [defaultdict
                     Counter])

(pys
  "

class Solution:
    def numberOfGoodPaths(self, vals: List[int], edges: List[List[int]]) -> int:
        return sol(vals, edges)


")


(defn sol [vs es]
  (setv g (get-graph es)
        l (len vs)
        to-visit (* [True] l)
        rst 0)

  (defn recur [node]
    (nonlocal rst)
    (setv (get to-visit node) False
          nodev (get vs node)
          single-paths (Counter))
    (for [c (get g node)]
      (when (get to-visit c)
        (for [[key val] (.items (recur c))]
          (when (>= key nodev)
            (+= rst (* (get single-paths key) val))
            (+= (get single-paths key) val)))))
    (+= (get single-paths nodev) 1)
    (+= rst (get single-paths nodev))
    single-paths)
  
  (recur (if (> l 2) (max g :key (fn [x] (len (get g x)))) 0))
  
  rst)

(defn get-graph [es]
  (setv rst (defaultdict list))
  (for [[a b] es]
    (.append (get rst a) b)
    (.append (get rst b) a))
  rst)

(comment
  
  (test "vals = [1,3,2,1,3], edges = [[0,1],[0,2],[2,3],[2,4]]")

  (num-good-path [1 2 2])

  (test "a = [5,1,4,2,1,5,4,3], b = [[1,0],[2,0],[3,2],[4,2],[5,4],[6,4],[6,7]]")

  )
