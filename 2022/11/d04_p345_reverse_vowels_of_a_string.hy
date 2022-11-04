;;; hy==1.0a4

(defclass Solution []
  (defn reverseVowels [self s]
    (setv vowels (set "aeiouAEIOU")
          filtered (lfor c s :if (in c vowels) c)
          rst "")
    (for [c s]
      (+= rst (if (in c vowels)
                  (filtered.pop)
                  c)))
    rst))
