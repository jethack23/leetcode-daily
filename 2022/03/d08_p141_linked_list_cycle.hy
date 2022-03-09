;;; hy==1.0a4

(defclass Solution []
  (defn hasCycle [self head]
    (if (or (not head)
            (not head.next))
        (return False))
    (setv faster head.next
          slower head)
    (while faster.next
      (if (= slower faster)
          (return True))
      (setv faster faster.next
            slower slower.next)
      (if (not faster)
          (return False))
      (if faster.next
          (setv faster faster.next)
          (return False)))
    False))
