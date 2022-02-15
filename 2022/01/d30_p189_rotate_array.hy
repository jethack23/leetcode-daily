;;; hy==1.0a4

(defclass Solution []
  (defn rotate [self nums k]
    (for [_ (range k)]
      (nums.insert 0 (nums.pop)))))
