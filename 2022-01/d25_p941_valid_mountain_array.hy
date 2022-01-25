(defclass Solution []
  (defn validMountainArray [self arr]
    (setv climbing True
          l (len arr))
    (if (or (< l 3) (> (get arr 0) (get arr 1)) (< (get arr (- l 2)) (get arr (- l 1))))
        (return False))
    (for [i (range 1 l)]
      (setv diff (- (get arr i) (get arr (- i 1))))
      (cond [(= 0 diff) (return False)]
            [(and (not climbing) (> diff 0)) (return False)]
            [(and climbing (< diff 0) (setv climbing False))]))
    True))
