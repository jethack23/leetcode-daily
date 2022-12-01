;;; hy==1.0a4

(defclass Solution []
  (defn halvesAreAlike [self s]
    (sol s)))

(defn vowel? [c]
  (in c "aeiouAEIOU"))

(defn num_vowels [s]
  (len (list (filter (fn [x] (vowel? x)) (list s)))))

(defn alike? [a b]
  (= (num_vowels a) (num_vowels b)))

(defn split [s]
  (setv l (len s))
  [(get s (slice 0 (// l 2)))
   (get s (slice (// l 2) l))])

(defn sol [s]
  (alike? #* (split s)))
