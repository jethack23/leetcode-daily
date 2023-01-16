(import typing *)
(defmacro comment [#* b])

(defn kw2args [#** kwargs]
  (.values kwargs))

(defmacro test [s]
  (setv ns (+ "print(sol(*kw2args(" s ")))"))
  `(pys ~ns))

(import collections [defaultdict
                     Counter])

(require hyrule [->>])

(pys
  "

class Solution:
    def numberOfGoodPaths(self, vals: List[int], edges: List[List[int]]) -> int:
        return sol(vals, edges)


")


(defn sol [vs es]
  (setv nodes-by-value (defaultdict list)
        es (sort-edges es vs)
        [union find] (get-union-find (len vs))
        rst 0)
  
  (for [[i v] (enumerate vs)]
    (.append (get nodes-by-value v) i))
  (setv nodes-by-value (sorted (.items nodes-by-value)))
  (for [[v nodes] nodes-by-value]
    (while (and es (= v (get (get es -1) 0)))
      (union #* (get (es.pop) -1)))
    (setv root-cnt (Counter))
    (for [n nodes]
      (+= (get root-cnt (find n)) 1))
    (+= rst (sum (map (fn [x] (// (* x (+ x 1)) 2))
                      (root-cnt.values)))))
  rst)

(defn sort-edges [es vs]
  (->> es
       (map (fn [x] [(max (lfor n x (get vs n))) x]))
       (sorted :reverse True)))

(defn get-union-find [n]
  (setv parents (list (range n))
        rank (* [1] n))

  (defn union [x y]
    (when (!= (find x) (find y))
      (setv [x y] (if (> (get rank x) (get rank y))
                      [y x]
                      [x y]))
      (+= (get rank (find y)) (get rank (find x)))
      (setv (get parents (find x)) (find y)
            (get parents x) (find y))))

  (defn find [x]
    (if (= x (get parents x))
        x
        (do (setv (get parents x) (find (get parents x)))
            (get parents x))))
  [union find])

(comment
  
  (test "vals = [1,3,2,1,3], edges = [[0,1],[0,2],[2,3],[2,4]]")

  (num-good-path [1 2 2])

  (test "a = [5,1,4,2,1,5,4,3], b = [[1,0],[2,0],[3,2],[4,2],[5,4],[6,4],[6,7]]")


  ;; union-find

  (setv n 10)

  )
