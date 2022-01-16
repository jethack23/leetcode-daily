;;; hy=1.0a4

(defclass Solution []
  (defn maxDistToClosest [self seats]
    (defn starting-zeros [lst]
      (for [[i v] (enumerate seats)]
        (if (= v 1) (return i))))
    (setv l (len seats)
          max-distance (starting-zeros seats)
          last-occupied max-distance)
    (for [[i v] (enumerate seats)]
      (when (= v 1)
        (setv last-distance (// (- i last-occupied) 2))
        (when (< max-distance last-distance)
          (setv max-distance last-distance))
        (setv last-occupied i)))
    (max max-distance (- (- l 1) last-occupied))))


;; class Solution:

;;     def maxDistToClosest(self, seats):

;;         def starting_zeros(lst):
;;             for [i, v] in enumerate(seats):
;;                 if v == 1:
;;                     return i
;;                     _hy_anon_var_1 = None
;;                 else:
;;                     _hy_anon_var_1 = None
;;         l = len(seats)
;;         max_distance = starting_zeros(seats)
;;         last_occupied = max_distance
;;         for [i, v] in enumerate(seats):
;;             if v == 1:
;;                 last_distance = (i - last_occupied) // 2
;;                 if max_distance < last_distance:
;;                     max_distance = last_distance
;;                     _hy_anon_var_2 = None
;;                 else:
;;                     _hy_anon_var_2 = None
;;                 last_occupied = i
;;                 _hy_anon_var_3 = None
;;             else:
;;                 _hy_anon_var_3 = None
;;         return max(max_distance, l - 1 - last_occupied)
