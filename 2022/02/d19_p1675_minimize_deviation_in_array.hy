;;; hy==1.0a4

(import heapq [heappop heappush])

(defclass Solution []
  (defn minimumDeviation [self nums]
    (setv mem []
          rst (** 10 9)
          push (fn [mem n] (heappush mem (- n)))
          pop (fn [mem] (- (heappop mem))))
    (for [n nums]
      (push mem (if (% n 2) (* n 2) n)))
    (setv m (- (max mem)))
    (while True
      (setv M (pop mem)
            rst (min rst (- M m)))
      (if (% M 2)
          (break)
          (do (setv m (min m (// M 2)))
              (push mem (// M 2)))))
    rst))

(setv examples [[1 2 3 4]
                [4 1 5 20 3]
                [2 10 8]]
      s (Solution))

(for [e examples]
  (print (.minimumDeviation s e)))
