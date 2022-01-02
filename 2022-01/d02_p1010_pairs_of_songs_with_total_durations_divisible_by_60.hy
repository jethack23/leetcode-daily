;;; naive
(defclass Solution []
  (defn numPairsDivisibleBy60 [self times]
    (setv times (list (map (fn [x] (% x 60)) times))
          mem (lfor i (range 60) 0)
          rst 0)
    (for [t times]
      (+= rst (get mem (% (- 60 t) 60)))
      (+= (get mem t) 1))
    rst))

;; class Solution:

;;     def numPairsDivisibleBy60(self, times):
;;         times = list(map(lambda x: x % 60, times))
;;         mem = [0 for i in range(60)]
;;         rst = 0
;;         for t in times:
;;             rst += mem[(60 - t) % 60]
;;             mem[t] += 1
;;         return rst


;;; effective
(import [collections [defaultdict]])

(defclass Solution []
  (defn numPairsDivisibleBy60 [self times]
    (setv mem (defaultdict int)
          rst 0)
    (for [t times]
      (+= (get mem (% t 60)) 1))
    (for [[r n] (mem.items)]
      (cond [(or (= r 30) (= r 0)) (+= rst (// (* n (- n 1)) 2))]
            [(and (< r 30) (in (- 60 r) mem)) (+= rst (* n (get mem (- 60 r))))]))
    rst))

;; from collections import defaultdict

;; class Solution:

;;     def numPairsDivisibleBy60(self, times):
;;         mem = defaultdict(int)
;;         rst = 0
;;         for t in times:
;;             mem[t % 60] += 1
;;         for [r, n] in mem.items():
;;             if r == 30 or r == 0:
;;                 rst += n * (n - 1) // 2
;;                 _hy_anon_var_2 = None
;;             else:
;;                 if r < 30 and 60 - r in mem:
;;                     rst += n * mem[60 - r]
;;                     _hy_anon_var_1 = None
;;                 else:
;;                     _hy_anon_var_1 = None
;;                 _hy_anon_var_2 = _hy_anon_var_1
;;         return rst
