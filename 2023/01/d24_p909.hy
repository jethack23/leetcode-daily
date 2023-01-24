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
    def snakesAndLadders(self, board: List[List[int]]) -> int:
        return sol(board)


")

(import collections [deque])

(defn get-coord [x l]
  (setv q (// (- x 1) l)
        col (if (% q 2)
                (- l 1 (% (- x 1) l))
                (% (- x 1) l)))
  [(- l 1 q) col])

(defn coord2idx [x y l]
  (setv row (- l 1 x)
        remainder (if (% row 2)
                      (- l 1 y)
                      y))
  (+ 1 (* row l) remainder))

(defn sol [b]
  (setv l (len b)
        q (deque [[1 0]])
        rst -1
        visited (* [False] (+ (* l l) 1)))
  (while q
    (print q)
    (setv [x s] (q.popleft))
    (for [i (range (+ x 1) (+ x 7))]
      (cond (= i (* l l)) (return (+ s 1))
            (not (get visited i)) (do (setv (get visited i) True
                                            [x y] (get-coord i l)
                                            at-board (get (get b x) y))
                                      (cond (= at-board -1) (q.append [i (+ s 1)])
                                            (= at-board (* l l)) (return (+ s 1))
                                            True (q.append [at-board (+ s 1)]))))))
  
  rst)


(comment
  (pys "b = [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]]")
  (test "b = [[-1,-1,27,13,-1,25,-1],[-1,-1,-1,-1,-1,-1,-1],[44,-1,8,-1,-1,2,-1],[-1,30,-1,-1,-1,-1,-1],[3,-1,20,-1,46,6,-1],[-1,-1,-1,-1,-1,-1,29],[-1,29,21,33,-1,-1,-1]]")

  

  )
