;;; hy==1.0a4
;;; graham scan. flaw to skip trees in last line

(import math [sqrt])

(defn distance [A B]
  (setv [ax ay] A
        [bx by] B)
  (sqrt (+ (** (- ax bx) 2)
           (** (- ay by) 2))))

(defn neg-cos [A B C]
  (setv a (distance B C)
        b (distance A C)
        c (distance A B))
  (/ (- (+ (** b 2)
           (** c 2))
        (** a 2))
     (* 2 b c)))

(defn vec [A B]
  [(- (get B 0) (get A 0))
   (- (get B 1) (get A 1))])

(defn clock-wise-turn? [A B C]
  (setv [a b] (vec A B)
        [c d] (vec B C))
  (>= (- (* a d) (* b c)) 0))

(defn convex-hull [ps]
  (setv start (min ps :key (fn [p] (setv [x y] p) [y x]))
        stack [start])
  (for [p (sorted (lfor p ps :if (!= p start) p)
                  :key (fn [p] [(neg-cos start
                                         p
                                         [(- (get start 0) 1) (get start 1)])
                                (distance start p)]))]
    (while (and (>= (len stack) 3)
                (not (clock-wise-turn? (get stack -2)
                                       (get stack -1)
                                       p)))
      (stack.pop))
    (stack.append p))
  stack)

(defclass Solution []
  (defn outerTrees [self trees]
    (convex-hull trees)))
