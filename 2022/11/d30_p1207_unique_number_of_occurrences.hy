;;; hy==1.0a4

(import collections [Counter])

(defn no-duplicate? [xs]
  (= (len xs) (len (set xs))))

(defclass Solution []
  (defn uniqueOccurrences [self xs]
    (no-duplicate? (.values (Counter xs)))))
