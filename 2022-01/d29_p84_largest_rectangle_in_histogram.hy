;;; hy==1.0a4

(defclass Solution []
  (defn largestRectangleArea [self heights]
    (setv mem []
          rst 0)
    (heights.append 0)
    (for [[pos h] (enumerate heights)]
      (setv left-most pos)
      (while (and mem (>= (get (get mem -1) 0) h))
        (setv [pop-height pop-pos] (mem.pop)
              left-most (min left-most pop-pos)
              rst (max rst (* pop-height (- pos pop-pos)))))
      (mem.append (, h left-most)))
    rst))
