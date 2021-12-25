(import [collections [deque]])

(defclass Solution []
  (defn calculate [self s]
    (setv operators "+-*/")
    (defn split-operation [lst]
      (setv ret (deque)
            cur "")
      (for [c lst]
        (if (in c operators)
            (do (ret.append (int cur))
                (setv cur "")
                (ret.append c))
            (+= cur c)))
      (if cur (ret.append (int cur)))
      ret)
    (defn parse [s]
      (->> s
           (filter (fn [c] (not (= c " "))))
           (deque)
           (split-operation)))
    (defn calc [op a b]
      (cond [(= op "+") (+ a b)]
            [(= op "-") (- a b)]
            [(= op "*") (* a b)]
            [(= op "/") (// a b)]))
    (defn calc-ops [parsed ops]
      (setv mem (deque))
      (while parsed
        (setv v (parsed.popleft))
        (if (in v ops)
            (mem.append (calc v (mem.pop) (parsed.popleft)))
            (mem.append v)))
      mem)
    (defn sol [parsed]
      (-> parsed
          (calc-ops (list "*/"))
          (calc-ops (list "+-"))
          (get 0)))
    (sol (parse s))))
