(defclass Solution []
  (defn bitwiseComplement [self num]
    (setv l 2)
    (while (<= l num)
      (<<= l 1))
    (- l num 1)))

;; class Solution:

;;     def bitwiseComplement(self, num):
;;         l = 2
;;         while l <= num:
;;             l <<= 1
;;         return l - num - 1
