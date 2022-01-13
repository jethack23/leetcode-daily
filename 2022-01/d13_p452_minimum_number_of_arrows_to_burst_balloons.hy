;;; hy==1.0a4

(import collections [deque])

(defclass Solution []
  (defn findMinArrowShots [self points]
    (setv mem (deque (sorted points))
          rst 0)
    (while mem
      (setv [_ shot] (mem.popleft))
      (while (and mem (>= shot (get (get mem 0) 0)))
        (setv shot (min shot (get (mem.popleft) 1))))
      (+= rst 1))
    rst))


;; class Solution:

;;     def findMinArrowShots(self, points):
;;         mem = deque(sorted(points))
;;         rst = 0
;;         while mem:
;;             [_, shot] = mem.popleft()
;;             while mem and shot >= mem[0][0]:
;;                 shot = min(shot, mem.popleft()[1])
;;             rst += 1
;;         return rst
