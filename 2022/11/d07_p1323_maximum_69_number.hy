;;; hy==1.0a4

;;; use built-in str method
(defclass Solution []
  (defn maximum69Number [self n]
    (int (.replace (str n) "6" "9" 1))))

;;; from scratch
(defclass Solution []
  (defn maximum69Number [self n]
    (setv s [])
    (while n
      (s.append (% n 10))
      (//= n 10))
    (while (and s (= (get s -1) 9))
      (*= n 10)
      (+= n (s.pop)))
    (when s
        (*= n 10)
        (+= n 9)
        (s.pop))
    (while s
      (*= n 10)
      (+= n (s.pop)))
    n))
