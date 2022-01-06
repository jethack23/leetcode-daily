(import [heapq [heappush heappop]])

(defclass Solution []
  (defn carPooling [self trips capacity]
    (setv mem []
          current 0)
    (for [[passengers from to] trips]
      (heappush mem [from passengers])
      (heappush mem [to (- passengers)]))
    (while mem
      (+= current (get (heappop mem) 1))
      (if (< capacity current) (return False)))
    True))


;; class Solution:

;;     def carPooling(self, trips, capacity):
;;         mem = []
;;         current = 0
;;         for [passengers, hyx_from, to] in trips:
;;             heappush(mem, [hyx_from, passengers])
;;             heappush(mem, [to, -passengers])
;;         while mem:
;;             current += heappop(mem)[1]
;;             if capacity < current:
;;                 return False
;;                 _hy_anon_var_1 = None
;;             else:
;;                 _hy_anon_var_1 = None
;;         return True
