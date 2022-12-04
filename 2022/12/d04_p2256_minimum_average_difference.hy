;;; hy==1.0a4

(defn sol [ns]
  (setv lsum 0
        rsum (sum ns)
        l (len ns)
        rst 0
        record 100000)
  (for [[i n] (enumerate ns)]
    (+= lsum n)
    (-= rsum n)
    (setv ad (avg-diff lsum (+ i 1) rsum l))
    (when (> record ad)
      (setv record ad
            rst i)))
  rst)

(defn avg-diff [lsum lnum rsum totalnum]
  (abs-diff (round-down (avg lsum lnum))
            (round-down (avg rsum (- totalnum lnum)))))

(defn avg [sumx n]
  (if (= sumx 0) 0 (/ sumx n)))

(defn abs-diff [x y]
  (abs (- x y)))

(defn round-down [x]
  (int x))
