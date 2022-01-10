;;; built in
(defclass Solution []
  (defn addBinary [self a b]
    (get (bin (+ (int a 2) (int b 2))) (slice 2 None))))

;;; implement
(defclass Solution []
  (defn addBinary [self a b]
    (defn get-num [b-string]
      (setv rst 0)
      (for [c b-string]
        (*= rst 2)
        (+= rst (int c)))
      rst)
    (defn get-string [n]
      (setv rst "")
      (while n
        (setv rst (+ (str (% n 2)) rst))
        (//= n 2))
      (if rst rst "0"))
    (get-string (+ (get-num a) (get-num b)))))
