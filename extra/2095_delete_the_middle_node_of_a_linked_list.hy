(defclass Solution []
  (defn deleteMiddle [self head]
    (setv cur head
          future head.next
          past None)
    (while future
      (setv past cur
            cur cur.next
            future future.next)
      (if future
          (setv future future.next)))
    (if past
        (setv past.next cur.next)
        (setv head None))
    head))
