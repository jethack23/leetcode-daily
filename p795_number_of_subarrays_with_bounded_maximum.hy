;;; hy==1.0a4

(defclass Solution []
  (defn numSubarrayBoundedMax [self nums left right]
    (nums.append (+ right 1))
    (defn summation-rule [n]
      (// (* n (+ n 1)) 2))
    (setv add-l 0
          remove-l 0
          rst 0)
    (for [[i v] (enumerate nums)]
      (if (>= v left) (do (-= rst (summation-rule (- i remove-l)))
                          (setv remove-l (+ i 1))))
      (if (> v right) (do (+= rst (summation-rule (- i add-l)))
                          (setv add-l (+ i 1)))))
    rst))

;; class Solution:

;;     def numSubarrayBoundedMax(self, nums, left, right):
;;         nums.append(right + 1)

;;         def summation_rule(n):
;;             return n * (n + 1) // 2
;;         add_l = 0
;;         remove_l = 0
;;         rst = 0
;;         for [i, v] in enumerate(nums):
;;             if v >= left:
;;                 rst -= summation_rule(i - remove_l)
;;                 remove_l = i + 1
;;                 _hy_anon_var_7 = None
;;             else:
;;                 _hy_anon_var_7 = None
;;             if v > right:
;;                 rst += summation_rule(i - add_l)
;;                 add_l = i + 1
;;                 _hy_anon_var_8 = None
;;             else:
;;                 _hy_anon_var_8 = None
;;         return rst
