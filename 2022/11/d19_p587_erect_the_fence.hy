;;; hy==1.0a4
;;; monotone chain convex hull.

(import math [sqrt])

(defn vec [A B]
  [(- (get B 0) (get A 0))
   (- (get B 1) (get A 1))])

(defn exterior-product [A B C]
  (setv [a b] (vec A B)
        [c d] (vec B C))
  (- (* a d) (* b c)))

(defn convex-hull [ps]
  (ps.sort)
  (setv stack [])
  (for [p (+ (get ps (slice None -1))
             (get ps (slice None None -1)))]
    (while (and (>= (len stack) 2)
                (> (exterior-product (get stack -2) (get stack -1) p) 0))
      (stack.pop))
    (stack.append p))
  (list (.values (dfor p stack [(.join "," (map str p)) p]))))

(defclass Solution []
  (defn outerTrees [self trees]
    (convex-hull trees)))
