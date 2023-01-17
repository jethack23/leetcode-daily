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
    def minFlipsMonoIncr(self, s: str) -> int:
        return sol(s)


")


(defclass Solution []
  (defn minFlipsMonoIncr [self s]
    (sol s)))

(defn sol [s]
  (from-int-seq (list (map int s))))

(defn from-int-seq [s]
  (setv l (len s)
        rcnt (- l (sum s))
        rst rcnt
        lcnt 0)
  
  (for [b s]
    (if b
        (+= lcnt 1)
        (-= rcnt 1))
    (setv rst (min rst (+ lcnt rcnt))))
  rst)



(comment
  
  
  
  )
