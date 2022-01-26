;;; hy==1.0a4

(import collections [deque])

(defn dfs [node [rst None]]
  (if (is rst None)
      (setv rst []))
  (when node
    (dfs node.left rst)
    (rst.append node.val)
    (dfs node.right rst))
  rst)

(defclass Solution []
  (defn getAllElements [self root1 root2]
    (setv lst1 (deque (dfs root1))
          rst [])
    (for [v (dfs root2)]
      (while (and lst1 (< (get lst1 0) v))
        (rst.append (lst1.popleft)))
      (rst.append v))
    (for [v lst1]
      (rst.append v))
    rst))
