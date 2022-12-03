;;; hy==1.0a4

(import hyrule [reduce])

(import collections [Counter])

(defclass Solution []
  (defn frequencySort [self s]
    (sol s)))

(defn sol [s]
  (reduce (fn [x y] (+ x y))
          (map (fn [x]
                 (.join "" (* [(get x 0)] (get x 1))))
               (sorted (.items (Counter s))
                       :key (fn [x] (get x 1))
                       :reverse True))))

(sol "tree")
