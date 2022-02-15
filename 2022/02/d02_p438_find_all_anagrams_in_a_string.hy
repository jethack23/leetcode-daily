;;; hy==1.0a4

(import collections [defaultdict])

(defclass Solution []
  (defn findAnagrams [self s p]
    (defn chr-cnt [s]
      (setv rst (defaultdict int))
      (for [c s]
        (+= (get rst c) 1))
      rst)
    (setv l (len p)
          need (chr-cnt p)
          distance (sum (lfor [c n] (need.items) n))
          rst [])
    (for [[i c] (enumerate s)]
      ;; append
      (if (> (get need c) 0)
          (-= distance 1)
          (+= distance 1))
      (-= (get need c) 1)
      ;; popleft
      (when (>= i l)
        (if (< (get need (get s (- i l))) 0)
            (-= distance 1)
            (+= distance 1))
        (+= (get need (get s (- i l))) 1))
      ;; check distance
      (if (= distance 0) (rst.append (- i (- l 1)))))
    rst))
