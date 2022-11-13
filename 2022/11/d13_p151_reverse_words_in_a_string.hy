;;; hy==1.0a4

(defclass Solution []
  (defn reverseWords [self s]
    (.join " " (reversed (.split s)))))
