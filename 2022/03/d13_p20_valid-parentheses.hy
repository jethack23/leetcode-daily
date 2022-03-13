;;; hy==1.0a4

(defclass Solution []
  (defn isValid [self s]
    (setv opening (set (list "({["))
          matching {"(" ")"
                    "{" "}"
                    "[" "]"}
          stack [])
    (for [c s]
      (if (in c opening)
          (stack.append c)
          (if (or (not stack) (!= c (get matching (stack.pop))))
              (return False))))
    (not stack)))
