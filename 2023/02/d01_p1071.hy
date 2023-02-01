(defclass Solution []
  (defn gcdOfStrings [self str1 str2]
    (sol str1 str2)))

(defn sol [s1 s2]
  (setv l1 (len s1)
        l2 (len s2)
        a (max l1 l2)
        b (min l1 l2))
  (while (!= b 0)
    (setv [a b] [b (% a b)]))
  (setv f1 (get s1 (slice None a))
        f2 (get s2 (slice None a)))
  (if (and (= f1 f2)
           (= s1 (* f1 (// l1 a)))
           (= s2 (* f2 (// l2 a))))
      f1
      ""))
