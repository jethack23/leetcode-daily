(import [functools [cache]])

(defclass Solution []
  (defn maxCoins [self nums]
    (setv nums (+ [1] nums [1]))
    #@(cache
        (defn score [i j]
          (cond [(and (= 1 (len (set (get nums (slice i (+ j 1))))))
                      (> j i))
                 (do (setv v (get nums i)
                           left (get nums (- i 1))
                           right (get nums (+ j 1)))
                     (+ (* left v right)
                        (* (max left right) v v)
                        (* (- j i 1) v v (max left right v))))]
                [(< j i) 0]
                [True (max (lfor k (range i (+ j 1))
                                 (+ (score i (- k 1))
                                    (* (get nums (- i 1))
                                       (get nums k)
                                       (get nums (+ j 1)))
                                    (score (+ k 1) j))))])))
    (score 1 (- (len nums) 2))))


;; from functools import cache

;;     def maxCoins(self, nums):
;;         nums = [1] + nums + [1]

;;         @cache
;;         def score(i, j):
;;             if 1 == len(set(nums[slice(i, j + 1)])) and j > i:
;;                 v = nums[i]
;;                 left = nums[i - 1]
;;                 right = nums[j + 1]
;;                 _hy_anon_var_44 = left * v * right + max(left, right) * v * v + (j - i - 1) * v * v * max(left, right, v)
;;             else:
;;                 _hy_anon_var_44 = 0 if j < i else max([score(i, k - 1) + nums[i - 1] * nums[k] * nums[j + 1] + score(k + 1, j) for k in range(i, j + 1)]) if True else None
;;             return _hy_anon_var_44
;;         return score(1, len(nums) - 2)
