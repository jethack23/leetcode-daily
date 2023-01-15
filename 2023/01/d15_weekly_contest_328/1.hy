(defmacro comment [#* body])

(defclass Solution []
  (defn differenceOfSum [self nums]
    (sol nums)))

(defn sol [ns]
  (difference (sum ns) (sum (map digit-sum ns))))

(defn difference [a b]
  (abs (- a b)))

(defn digit-sum [n [rst 0]]
  (if (> n 0)
      (digit-sum (// n 10) (+ rst (% n 10)))
      rst))

(comment
  (digit-sum 10)

  (sol [1 15 6 3])
  )
