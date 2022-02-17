;;; hy==1.0a4

(defclass Solution []
  (defn combinationSum [self candidates target]
    (candidates.sort)
    (setv l (len candidates)
          rst [])
    (defn dfs [i target current]
      (when (= target 0)
        (rst.append current))
      (when (and (>= i 0) (> target 0))
        (setv x (get candidates i))
        (for [j (range (+ 1 (// target x)))]
          (dfs (- i 1) (- target (* j x)) (+ current (* [x] j))))))
    (dfs (- l 1) target [])
    rst))

(.combinationSum (Solution) [2 3 6 7] 7)
