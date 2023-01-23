(import typing *)
(defmacro comment [#* b])

(defn kw2args [#** kwargs]
  (.values kwargs))

(defmacro test [s]
  (setv ns (+ "print(sol(*kw2args(" s ")))"))
  `(pys ~ns))

(pys
  "

class Solution:
    def findJudge(self, n: int, trust: List[List[int]]) -> int:
        return sol(n, trust)


")


(defn sol [n trust]
  (setv point (* [0] n)
        rst -1)
  (for [[a b] trust]
    (-= (get point (- a 1)) 1)
    (+= (get point (- b 1)) 1))
  (for [[i p] (enumerate point)]
    (when (= p (- n 1))
      (setv rst (+ i 1))
      (break)))
  rst)

(comment
  
  (pys "n = 2
trust = [[1,2]]")

  (test "n = 2, trust = [[1,2]]")
  (test "n = 3, trust = [[1,3],[2,3],[3,1]]")
  
  )
