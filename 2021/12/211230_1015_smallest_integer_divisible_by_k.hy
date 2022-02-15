(defclass Solution []
  (defn smallestRepunitDivByK [slef k]
    (setv cnt 1
          rem (% 1 k)
          mem #{0})
    (while (not (in rem mem))
      (mem.add rem)
      (*= rem 10)
      (+= rem 1)
      (%= rem k)
      (+= cnt 1))
    (if (= rem 0)
        cnt
        -1)))


;; class Solution:

;;     def smallestRepunitDivByK(slef, k):
;;         cnt = 1
;;         rem = 1 % k
;;         mem = {0}
;;         while not rem in mem:
;;             mem.add(rem)
;;             rem *= 10
;;             rem += 1
;;             rem %= k
;;             cnt += 1
;;         return cnt if rem == 0 else -1
