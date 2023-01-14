(defclass Solution []
  (defn smallestEquivalentString [self s1 s2 baseStr]
    (sol s1 s2 baseStr)))

(defn sol [a b s]
  (setv parents (propagate-root (get-parents a b)))
  (.join "" (map idx-to-alphabet (lfor i (map alphabet-to-idx s) (get parents i)))))

(defn alphabet-to-idx [x]
  (- (ord x) (ord "a")))

(defn idx-to-alphabet [x]
  (chr (+ (ord "a") x)))

(defn get-root [x parent]
  (while (!= x (get parent x))
    (setv x (get parent x)))
  x)

(defn get-parents [a b]
  (setv rst (list (range 26)))
  (for [[c d] (zip (map alphabet-to-idx a) (map alphabet-to-idx b))]
    (setv cr (get-root c rst)
          dr (get-root d rst))
    (when (< dr cr)
      (setv [cr dr] [dr cr]))
    (setv (get rst dr) cr))
  rst)

(defn propagate-root [parents]
  (for [[i p] (enumerate parents)]
    (setv (get parents i) (get parents p)))
  parents)
