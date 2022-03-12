;;; hy==1.0a4

(defclass Solution []
  (defn copyRandomList [self head]
    (if (not head) (return None))
    ;; interweave
    (setv cur head)
    (while cur
      (setv cur.next (Node cur.val cur.next)
            cur cur.next.next))
    ;; copy random pointer information
    (setv cur head)
    (while cur
      (setv cur.next.random (if cur.random cur.random.next None)
            cur cur.next.next))
    ;; resolve interweaving
    (setv cur head
          rst head.next)
    (while cur
      (setv copied cur.next
            cur.next cur.next.next
            copied.next (if copied.next copied.next.next None)
            cur cur.next))
    rst))
