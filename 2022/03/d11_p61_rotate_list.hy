;;; hy==1.0a4

(defclass Solution []
  (defn rotateRight [self head k]
    (if (or (is head None)
            (is head.next None))
        (return head))
    (setv tail head
          n 1)
    (while tail.next
      (setv tail tail.next)
      (+= n 1))
    (%= k n)
    (if (= k 0) (return head))
    (setv faster head
          cur head)
    (for [_ (range k)]
      (setv faster faster.next))
    (while faster.next
      (setv faster faster.next
            cur cur.next))
    (setv rst cur.next
          cur.next None
          tail.next head)
    rst))
