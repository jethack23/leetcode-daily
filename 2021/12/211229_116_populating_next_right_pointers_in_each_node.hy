(import [collections [deque]])

(defclass Solution []
  (defn connect [self root]
    (when root
      (setv d 1
            cnt d
            q (deque [root]))
      (while q
        (-= cnt 1)
        (setv node (q.popleft))
        (when node.left
          (q.append node.left)
          (q.append node.right))
        (if cnt
            (setv node.next (get q 0))
            (do (<<= d 1)
                (setv cnt d)))))
    root))

;; class Solution:

;;     def connect(self, root):
;;         if root:
;;             d = 1
;;             cnt = d
;;             q = deque([root])
;;             while q:
;;                 cnt -= 1
;;                 node = q.popleft()
;;                 if node.left:
;;                     q.append(node.left)
;;                     _hy_anon_var_10 = q.append(node.right)
;;                 else:
;;                     _hy_anon_var_10 = None
;;                 if cnt:
;;                     node.next = q[0]
;;                     _hy_anon_var_11 = None
;;                 else:
;;                     d <<= 1
;;                     cnt = d
;;                     _hy_anon_var_11 = None
;;             _hy_anon_var_12 = None
;;         else:
;;             _hy_anon_var_12 = None
;;         return root
