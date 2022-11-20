;;; hy==1.0a4

(import collections [deque])

(defn read-digits [ss]
  (setv rst ""
        digits (set "0123456789"))
  (while (and ss
              (in (get ss 0) digits))
    (+= rst (ss.popleft)))
  [rst ss])

(defn parse [s]
  (setv ss (deque (filter (fn [x] (!= x " ")) s))
        rst []
        non-digits (set "+-()")
        prev "(")
  (while ss
    (if (in (get ss 0) non-digits)
        (do (setv popped (ss.popleft))
            (rst.append (if (and (= prev "(") (= "-" popped))
                            "u"
                            popped))
            (setv prev popped))
        (do (setv [d ss] (read-digits ss)
                  prev d)
            (rst.append d))))
  rst)

(defn into-postfix [ts]
  (setv rst []
        ops [])
  (for [t ts]
    (cond [(= "(" t) (ops.append t)]
          [(= ")" t) (do (while (and ops (!= (get ops -1) "("))
                           (rst.append (ops.pop)))
                         (ops.pop))]
          [(in t "+-u") (do (while (and ops (in (get ops -1) "-u"))
                              (rst.append (ops.pop)))
                            (ops.append t))]
          [True (rst.append (int t))]))
  (while ops
    (rst.append (ops.pop)))
  rst)

(defn opresult [op b a]
  (cond [(= op "+") (+ a b)]
        [(= op "-") (- a b)]))

(defn calc-postfix [pf]
  (setv ss [])
  (for [t pf]
    (cond [(in t (set "+-"))
           (ss.append (opresult t (ss.pop) (ss.pop)))]
          [(= t "u")
           (ss.append (* -1 (ss.pop)))]
          [(ss.append t)]))
  (ss.pop))

(defclass Solution []
  (defn calculate [self s]
    (calc-postfix (into-postfix (parse s)))))
