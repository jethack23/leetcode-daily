(require hyrule [->>])

(import functools [reduce])

(defclass Solution []
  (defn convert [self s row]
    (sol s row)))

(defn sol [s row]
  (if (< row 2)
      s
      (->> (get-rows s row)
           (reduce (fn [x y] (+ x y)))
           (.join ""))))

(defn get-rows [s row]
  (setv o (- row 1)
        rows (lfor _ (range row) []))
  (for [[i c] (enumerate s)]
    (.append (get rows (- o (abs (- o (% i (* 2 o)))))) c))
  rows)
