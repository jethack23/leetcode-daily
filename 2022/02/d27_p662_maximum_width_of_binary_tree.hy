;;; hy==1.0a4

(import collections [deque])

(defclass Solution []
  (defn widthOfBinaryTree [self root]
    (setv q (deque [[0, root]])
          rst 0)
    (while q
      (setv nq (deque)
            rst (max rst (- (get (get q -1) 0) (get (get q 0) 0))))
      (while q
        (setv [pos node] (q.popleft))
        (if node.left
            (nq.append [(* 2 pos) node.left]))
        (if node.right
            (nq.append [(+ (* 2 pos) 1) node.right])))
      (setv q nq))
    (+ rst 1)))
