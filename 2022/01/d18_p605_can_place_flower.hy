;;; hy==1.0a4

(defclass Solution []
  (defn canPlaceFlowers [self flowerbed n]
    (defn count-availability [fb]
      (setv rst 0
            consec-zeros 1)
      (for [[i v] (enumerate fb)]
        (if (= v 0)
            (+= consec-zeros 1)
            (do (+= rst (// (- consec-zeros 1) 2))
                (setv consec-zeros 0))))
      (if consec-zeros
          (+= rst (// consec-zeros 2)))
      rst)
    (>= (count-availability flowerbed) n)))


;; class Solution:

;;     def canPlaceFlowers(self, flowerbed, n):

;;         def count_availability(fb):
;;             rst = 0
;;             consec_zeros = 1
;;             for [i, v] in enumerate(fb):
;;                 if v == 0:
;;                     consec_zeros += 1
;;                     _hy_anon_var_1 = None
;;                 else:
;;                     rst += (consec_zeros - 1) // 2
;;                     consec_zeros = 0
;;                     _hy_anon_var_1 = None
;;             if consec_zeros:
;;                 rst += consec_zeros // 2
;;                 _hy_anon_var_2 = None
;;             else:
;;                 _hy_anon_var_2 = None
;;             return rst
;;         return count_availability(flowerbed) >= n
