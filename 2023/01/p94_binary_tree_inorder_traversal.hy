;;; hy==0.25


(defclass Solution []
  (defn inorderTraversal [self root]
    (iter-sol2 root)))

(defn recur-sol [root]
  "trivial recursive solution"
  (setv rst [])
  (defn recur [node]
    (when (not (is node None))
      (recur node.left)
      (rst.append node.val)
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
          (do (st.append [cur.left "left"])
              (setv last-op "push"))

          (= last-op "left")
          (do (rst.append cur.val)
              (st.append [cur.right "right"])
              (setv last-op "push"))

          (= last-op "right")
          (do (st.pop)
              (setv last-op lr))))
  rst)

(defn iter-sol2 [root]
  "follow up: iterative solution
second approach"
  (defn closure-op [node]
    (fn [] (rst.append node.val)))
  (setv rst []
        st [[root None]])
  (while st
    (setv [cur f] (st.pop))
    (if (is f None)
        (when (not (is cur None))
          (st.append [cur.right None])
          (st.append [None (closure-op cur)])
          (st.append [cur.left None]))
        (f)))
  rst)
