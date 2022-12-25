;;; hy==0.25

(import bisect [bisect-right])

(defclass Solution []
  (defn answerQueries [self nums queries]
    (sol nums queries)))


(defn sol [nums queries]
  (setv psum (sort-and-prefix-sum nums)
        rst [])
  (for [q queries]
    (rst.append (- (bisect-right psum q) 1)))
  rst)

(defn sort-and-prefix-sum [nums]
  (setv rst [0])
  (for [n (sorted nums)]
    (rst.append (+ (get rst -1) n)))
  rst)

