;;; hy==1.0a4

(import collections [Counter])

(defclass Solution []
  (defn closeStrings [self w1 w2]
    (sol w1 w2)))

(defn sol [w1 w2]
  (close? w1 w2))

(defn close? [w1 w2]
  (and (same-charset w1 w2)
       (same-counter w1 w2)))

(defn same-charset [w1 w2]
  (= (set w1) (set w2)))

(defn same-counter [w1 w2]
  (= (sorted (.values (Counter w1)))
     (sorted (.values (Counter w2)))))
