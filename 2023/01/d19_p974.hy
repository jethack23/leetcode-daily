(import collections [Counter])

(defclass Solution []
  (defn subarraysDivByK [self nums k]
    (sol nums k)))

(defn sol [nums k]
  (setv psum (get-psum nums)
        cnt (Counter (map (fn [x] (% x k)) psum)))
  (sum (map (fn [x] (// (* x (- x 1)) 2))
            (cnt.values))))

(defn get-psum [nums]
  (setv rst [0]
        cur 0)
  (for [n nums]
    (+= cur n)
    (rst.append cur))
  rst)
