(import typing *)
(import collections [Counter deque])


(defmacro comment [#* b])

(pys "class Solution:
    def countGood(self, nums: List[int], k: int) -> int:
        return sol(nums, k)")

(defn sol [nums k]
  (setv cnt (Counter)
        q (deque)
        npair 0
        rst 0
        l (len nums))
  (for [[i n] (enumerate nums)]
    (q.append n)
    (+= npair (get cnt n))
    (+= (get cnt n) 1)
    (while (>= npair k)
      (+= rst (- l i))
      (setv popped (q.popleft))
      (-= (get cnt popped) 1)
      (-= npair (get cnt popped))
      ))
  rst)

(comment
  
  (sol [1 1 1 1 1] 10)

  (sol [3 1 4 3 2 2 4] 2)

  )
