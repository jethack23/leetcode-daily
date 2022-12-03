;;; hy==1.0a4

(import hyrule [reduce])

(import collections [Counter])

(defclass Solution []
  (defn frequencySort [self s]
    (sol s)))

(defn sol [s]
  (reduce (fn [x y] (+ x (* (get y 0) (get y 1))))
          (.most_common (Counter s))
          ""))

(sol "tree")
