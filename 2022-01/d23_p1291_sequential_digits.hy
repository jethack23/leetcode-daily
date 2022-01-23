;;; hy==1.0a4


(defmacro do-sth [#* body]
  (setv [condition body] [(get body -1) (get body (slice None -2))])
  `(do
     ~@body
     (while ~condition
       ~@body)))

(defn get-num [s-d cnt [rst 0]]
  (assert (<= (+ s-d cnt) 10))
  (for [i (range s-d (+ s-d cnt))]
    (*= rst 10)
    (+= rst i))
  rst)

(defn get-start-info [low]
  (setv unit 1
        cnt 1)
  (while (<= (* 10 unit) low)
    (*= unit 10)
    (+= cnt 1))
  (setv s-d (// low unit))
  (cond [(<= (+ s-d cnt) 10) [s-d cnt]]
        [(< cnt 9) [1 (+ cnt 1)]]
        [True [0 0]]))

(defn seq-digits-generator [low high]
  (setv [s-d cnt] (get-start-info low))
  (when s-d
    (do-sth
      (setv n (get-num s-d cnt))
      (if (<= low n high)
          (yield n))
      (if (< (+ s-d cnt) 10)
          (+= s-d 1)
          (setv [s-d cnt] [1 (+ cnt 1)]))
      :while
      (< cnt 10))))

(defclass Solution []
  (defn sequentialDigits [self low high]
    (list (seq-digits-generator low high))))
