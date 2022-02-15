(defclass Solution []
  (defn middleNode [self head]
    (setv cur head
          future head.next)
    (while future
      (setv cur cur.next
            future future.next)
      (if future
          (setv future future.next)))
    cur))

;; class Solution:

;;     def middleNode(self, head):
;;         cur = head
;;         future = head.next
;;         while future:
;;             cur = cur.next
;;             future = future.next
;;             if future:
;;                 future = future.next
;;                 _hy_anon_var_4 = None
;;             else:
;;                 _hy_anon_var_4 = None
;;         return cur

