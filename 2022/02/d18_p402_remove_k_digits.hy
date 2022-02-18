;;; hy==1.0a4

(import collections [deque])

(defclass Solution []
  (defn removeKdigits [self num k]
    (setv rst [])
    (for [d num]
      (while (and k rst (> (get rst -1) d))
        (rst.pop)
        (-= k 1))
      (rst.append d))
    (setv leading0 0)
    (for [[i v] (enumerate rst)]
      (if (= v "0")
          (+= leading0 1)
          (break)))
    (setv rst (.join "" (get rst (slice leading0 (- (len rst) k)))))
    (if rst
        rst
        "0")))


(setv examples [["1432219" 3]
                ["10200" 1]
                ["10" 2]])

(for [e examples]
  (print (.removeKdigits (Solution) #* e)))

