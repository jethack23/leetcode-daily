;;; hy==1.0a4

(defclass Solution []
  (defn swapPairs [self head]
    (defn recur [node]
      (if (or (not node.next) (not node.next.next))
          (return))
      (setv gson node.next.next
            node.next.next gson.next
            gson.next node.next
            node.next gson)
      (recur node.next.next))
    (setv node (ListNode 0 head))
    (recur node)
    node.next))
