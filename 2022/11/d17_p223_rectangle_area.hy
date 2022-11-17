;;; hy==1.0a4

(defclass Solution []
  (defn computeArea [self ax1 ay1 ax2 ay2 bx1 by1 bx2 by2]
    (setv cx1 (max ax1 bx1)
          cy1 (max ay1 by1)
          cx2 (min ax2 bx2)
          cy2 (min ay2 by2))
    (defn area [x1 y1 x2 y2]
      (* (max 0 (- x2 x1))
         (max 0 (- y2 y1))))
    (- (+ (area ax1 ay1 ax2 ay2)
          (area bx1 by1 bx2 by2))
       (area cx1 cy1 cx2 cy2))))
