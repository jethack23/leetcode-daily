(defclass Solution []
  (defn dailyTemperatures [self temps]
    (setv n (len temps)
          ret (* [0] n)
          stack [])
    (for [(, i t) (enumerate temps)]
      (while (and stack (< (get (get stack -1) 0) t))
        (setv (, _ j) (stack.pop)
              (get ret j) (- i j)))
      (stack.append (, t i)))
    ret))
