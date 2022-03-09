;;; hy==1.0a4

(defclass Solution []
  (defn deleteDuplicates [self head]
    (if (or (not head) (not head.next)) (return head))
    (setv rst (ListNode)
          connector rst
          cursor head)
    (while cursor
      (setv future cursor.next)
      (when (not future)
        (setv connector.next cursor)
        (break))
      (if (= future.val cursor.val)
          (while (and future (= future.val cursor.val))
            (setv future future.next))
          (setv connector.next cursor
                connector cursor
                connector.next None))
      (setv cursor future))
    rst.next))
