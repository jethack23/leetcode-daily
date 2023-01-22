(defclass Solution []
  (defn partition [self s]
    (sol s)))

(defn sol [s]
  (setv rst []
        l (len s))

  (defn recur [i cur lst]
    (if (= i l)
        (when (palindrome? cur) (rst.append (+ lst [cur])))
        (do (recur (+ i 1) (+ cur (get s i)) lst)
            (when (palindrome? cur)
              (recur (+ i 1) (get s i) (+ lst [cur])))))
    rst)

  (recur 0 "" []))

(defn palindrome? [s]
  (setv l (len s))
  (and s (reduce (fn [x y] (and x y))
                 (lfor i (range (// l 2))
                       (= (get s i)
                          (get s (- l 1 i))))
                 True)))
