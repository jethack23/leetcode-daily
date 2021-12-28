(defclass Solution []
  (defn findComplement [self num]
    (setv l 1)
    (while (<= l num)
      (<<= l 1))
    (- l num 1)))

;; class Solution:

;;     def findComplement(self, num):
;;         l = 1
;;         while l < num:
;;             l <<= 1
;;         return l - num - 1
