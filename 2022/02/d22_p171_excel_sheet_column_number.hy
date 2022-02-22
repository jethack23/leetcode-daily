;;; hy==1.0a4

(defclass Solution []
  (defn titleToNumber [self columnTitle]
    (setv char2num (dfor [i c] (enumerate "ABCDEFGHIJKLMNOPQRSTUVWXYZ") [c (+ i 1)])
          rst 0
          unit 1)
    (for [c (reversed columnTitle)]
      (+= rst (* unit (get char2num c)))
      (*= unit 26))
    rst))
