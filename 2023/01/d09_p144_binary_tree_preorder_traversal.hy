;;; hy==0.25


(defclass Solution []
  (defn preorderTraversal [self root]
    (iter-sol2 root)))

(defn recur-sol [root]
  "trivial recursive solution"
  (setv rst [])
  (defn recur [node]
    (when (not (is node None))
      (rst.append node.val)
      (recur node.left)
      (recur node.right))
    rst)
  (recur root))

(defn iter-sol [root]
  "follow up: iterative solution"
  (setv rst []
        st [[root "right"]]
        last-op "push")
  (while st
    (setv [cur lr] (get st -1))
    (cond (is cur None)
          (do (st.pop)
              (setv last-op lr))

          (= last-op "push")
          (do (rst.append cur.val)
              (st.append [cur.left "left"])
              (setv last-op "push"))

          (= last-op "left")
          (do (st.append [cur.right "right"])
              (setv last-op "push"))

          (= last-op "right")
          (do (st.pop)
              (setv last-op lr))))
  rst)

(defn iter-sol2 [root]
  "follow up: iterative solution
second approach"
  (setv rst []
        st [root])
  (while st
    (setv cur (st.pop))
    (when (not (is cur None))
      (rst.append cur.val)
      (st.append cur.right)
      (st.append cur.left)))
  rst)
