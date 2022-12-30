;;; hy==0.25

(import
  collections [deque]
  heapq [heappush heappop])

(defclass Solution []
  (defn getOrder [self ts]
    (sol ts)))

(defn sol [ts]
  (setv q (order-tasks ts)
        h []
        t 0
        rst [])
  (while (remain? q h)
    (move-tasks-available q h t)
    (setv [i t] (process-a-task q h t))
    (rst.append i))
  rst)

(defn remain? [q h]
  (or q h))

(defn order-tasks [ts]
  (deque (sorted (lfor [i [e p]] (enumerate ts) [p i e])
                 :key (fn [x] [(get x -1)
                               (get x 0)
                               (get x 1)]))))

(defn move-tasks-available [q h t]
  (while (and q (>= t (get (get q 0) -1)))
    (heappush h (q.popleft)))
  [q h])

(defn process-a-task [q h t]
  (setv [p i e] (if h (heappop h) (q.popleft)))
  [i (+ p (max t e))])
