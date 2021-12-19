(defclass Solution []
  (defn firstPalindrome [self words]
    (defn is-palindrome [s]
      (= s (get s (slice None None -1))))
    (for [s words]
      (if (is-palindrome s)
          (return s)))
    ""))
