(import [collections [defaultdict]])

(defclass Solution []
  (defn singleNumber [self nums]
    (setv mem (* [0] 32)
          ret 0
          neg 0)
    (for [n nums]
      (when (< n 0)
        (+= neg 1)
        (*= n -1))
      (setv i 0)
      (while n
        (if (% n 2)
            (+= (get mem i) 1))
        (//= n 2)
        (+= i 1)))
    (setv unit 1)
    (for [i (range (+ max-i 1))]
      (if (% (get mem i) 3)
          (+= ret unit))
      (<<= unit 1))
    (if (% neg 3)
        (- ret)
        ret)))
