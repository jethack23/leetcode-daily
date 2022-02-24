;;; hy==1.0a4

(defclass Solution []
  (defn sortList [self head]
    (defn merge-sort [node]
      (if (or (is node None) (is node.next None)) (return node))
      (setv slow node
            fast node.next.next)
      (while fast
        (setv slow slow.next
              fast fast.next)
        (if fast
            (setv fast fast.next)))
      (setv right (merge-sort slow.next)
            slow.next None
            left (merge-sort node)
            before-rst (ListNode)
            cur before-rst)
      (while (and left right)
        (if (< left.val right.val)
            (setv cur.next left
                  cur cur.next
                  left left.next)
            (setv cur.next right
                  cur cur.next
                  right right.next)))
      (if left
          (setv cur.next left)
          (setv cur.next right))
      before-rst.next)
    (merge-sort head)))
