(defclass Solution []
  (defn addSpaces [self s spaces]
    (setv start (+ [0] spaces)
          end (+ spaces [(len s)])
          pieces (lfor (, f e) (zip start end) (get s (slice f e))))
    (.join " " pieces)))
