;;; hy==0.25

(defclass Solution []
  (defn dailyTemperatures [self ts]
    (sol ts)))

(defn sol [ts]
  (loop-and-save ts (* [0] (len ts))))

(defn loop-and-save [ts mem]
  (setv stack [])
  (for [[i t] (enumerate ts)]
    (while (and stack
                (> t (get (get stack -1) 0)))
      (setv j (get (stack.pop) 1)
            (get mem j) (- i j)))
    (stack.append [t i]))
  mem)
