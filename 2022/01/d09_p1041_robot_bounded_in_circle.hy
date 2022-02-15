(defn linear-transform [A d]
  (lfor i (range 2) (sum (lfor j (range 2) (* (get d j) (get (get A i) j))))))

(defn turn-left [d]
  (setv A [[0 -1]
           [1 0]])
  (linear-transform A d))

(defn turn-right [d]
  (setv A [[0 1]
           [-1 0]])
  (linear-transform A d))

(defn move [pos d]
  (lfor i (range 2) (+ (get pos i) (get d i))))

(defclass Solution []
  (defn isRobotBounded [self instructions]
    (setv pos [0 0]
          direction [0 1])
    (for [ins instructions]
        (cond [(= ins "G") (setv pos (move pos direction))]
              [(= ins "L") (setv direction (turn-left direction))]
              [(= ins "R") (setv direction (turn-right direction))]))
    (or (= pos [0 0]) (!= direction [0 1]))))
