(defclass Solution []
  (defn middleNode [self head]
    (setv cur head
          future head.next)
    (while future
      (setv past cur
            cur cur.next
            future future.next)
      (if future
          (setv future future.next)))
    cur))
