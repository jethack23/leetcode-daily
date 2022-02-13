;;; hy==1.0a4


(import collections [Counter]
        itertools [chain])

(defclass Solution []
  (defn subsetsWithDup [self nums]
    (setv rst [[]]
          cnt (Counter nums))
    (for [[k v] (cnt.items)]
      (+= rst (chain #* (lfor i (range 1 (+ v 1))
                              (lfor s rst (+ s (* [k] i)))))))
    rst))
