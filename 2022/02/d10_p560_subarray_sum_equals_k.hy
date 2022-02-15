;;; hy==1.0a4

(import collections [defaultdict])

(defclass Solution []
  (defn subarraySum [self nums k]
    (setv current-pos 0
          mem (defaultdict int)
          rst 0)
    (setv (get mem 0) 1)
    (for [n nums]
      (+= current-pos n)
      (+= rst (get mem (- current-pos k)))
      (+= (get mem current-pos) 1))
    rst))
