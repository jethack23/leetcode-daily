;;; hy==1.0a4

(defclass Solution []
  (defn oddEvenList [self head]
    (sol head)))

(defn sol [head]
  (link-two-list #* (get-odd-even-lists head)))

(defn link-two-list [ah at bh bt]
  (connect at bh)
  ah)

(defn connect [a b]
  (when (not (is a None))
    (setv a.next b))
  b)

(defn dangle [cur]
  (setv rst cur.next
        cur.next None)
  rst)

(defn get-odd-even-lists [cur [ah None] [at None] [bh None] [bt None] [odd? True]]
  (if (is cur None)
      (if odd?
          [ah at bh bt]
          [bh bt ah at])
      (if (is ah None)
          (get-odd-even-lists (dangle cur) bh bt cur cur (not odd?))
          (get-odd-even-lists (dangle cur) bh bt ah (connect at cur) (not odd?)))))
