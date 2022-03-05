;;; hy==1.0a4

(import collections [Counter])

(defclass Solution []
  (defn deleteAndEarn [self nums]
    (setv n2score (defaultdict int)
          maxn (max nums))
    (n2score.update  (dfor [n c] (.items (Counter nums)) [n (* n c)]))
    (setv yesterday 0
          today (get n2score 1))
    (for [i (range 2 (+ maxn 1))]
      (setv [yesterday today] [today (max today (+ yesterday (get n2score i)))]))
    today))
