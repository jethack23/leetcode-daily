;;; hy==1.0a4

(defclass Solution []
  (defn addTwoNumbers [self l1 l2]
    (setv box (ListNode)
          cur box
          carry 0)
    (while (or l1 l2)
      (when l1
        (+= carry l1.val)
        (setv l1 l1.next))
      (when l2
        (+= carry l2.val)
        (setv l2 l2.next))
      (setv cur.next (ListNode (% carry 10))
            cur cur.next)
      (//= carry 10))
    (if carry
      (setv cur.next (ListNode carry)))
    box.next))
