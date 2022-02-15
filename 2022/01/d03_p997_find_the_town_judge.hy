(defclass Solution []
  (defn findJudge [self n trust]
    (setv trusts (lfor i (range (+ n 1)) 0)
          trusted (lfor i (range (+ n 1)) 0))
    (for [[a b] trust]
      (+= (get trusts a) 1)
      (+= (get trusted b) 1))
    (for [i (range 1 (+ n 1))]
      (if (and (= (get trusts i) 0)
               (= (get trusted i) (- n 1)))
          (return i)))
    -1))


;; class Solution:

;;     def findJudge(self, n, trust):
;;         trusts = [0 for i in range(n + 1)]
;;         trusted = [0 for i in range(n + 1)]
;;         for [a, b] in trust:
;;             trusts[a] += 1
;;             trusted[b] += 1
;;         for i in range(1, n + 1):
;;             if trusts[i] == 0 and trusted[i] == n - 1:
;;                 return i
;;                 _hy_anon_var_1 = None
;;             else:
;;                 _hy_anon_var_1 = None
;;         return -1
