;;; hy==1.0a4

(defn sol [ns]
  (setv l (len ns)
        rs (list (range 1 (+ l 1)))
        ls (list (range l))
        s []
        rst 0)
  (for [[i n] (enumerate ns)]
    (while (and s (< n (get (get s -1) 0)))
      (setv [_ j] (s.pop)
            (get rs j) i))
    (s.append [n i]))
  (while s
    (setv [_ j] (s.pop)
          (get rs j) l))
  (for [[i n] (zip (range (- l 1) -1 -1) (reversed ns))]
    (while (and s (<= n (get (get s -1) 0)))
      (setv [_ j] (s.pop)
            (get ls j) i))
    (s.append [n i]))
  (while s
    (setv [_ j] (s.pop)
          (get ls j) -1))
  (for [[l i r n] (zip ls (range l) rs ns)]
    (+= rst (* n (- i l) (- r i))))
  rst)

(defclass Solution []
  (defn sumSubarrayMins [self ns]
    (% (sol ns) 1000000007)))
