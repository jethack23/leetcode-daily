;;; hy==1.0a4

(defn valid? [row]
  (setv mem (* [0] 10))
  (for [n row]
    (when (!= n ".")
      (setv n (int n))
      (if (get mem n)
          (return False)
          (+= (get mem n) 1))))
  True)

(defn get-rows [b]
  b)

(defn get-cols [b]
  (setv rst [])
  (for [i (range 9)]
    (setv col [])
    (for [j (range 9)]
      (col.append (get (get b j) i)))
    (rst.append col))
  rst)

(defn get-boxs [b]
  (setv rst [])
  (for [i (range 0 9 3)]
    (for [j (range 0 9 3)]
      (setv box [])
      (for [di (range 3)]
        (for [dj (range 3)]
          (box.append (get (get b (+ i di)) (+ j dj)))))
      (rst.append box)))
  rst)

(defclass Solution []
  (defn isValidSudoku [self b]
    (for [row (get-rows b)]
      (when (not (valid? row)) (return False)))
    (for [col (get-cols b)]
      (when (not (valid? col)) (return False)))
    (for [box (get-boxs b)]
      (when (not (valid? box)) (return False)))
    True))
