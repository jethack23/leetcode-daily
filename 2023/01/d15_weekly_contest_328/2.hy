(defmacro comment [#* b])

(import collections [Counter])
(import heapq [heappush heappop])

(defclass Solution []
  (defn rangeAddQueries [self n qs]
    (sol n qs)))

(defn sol [n qs]
  (setv rst (lfor _ (range n) (lfor _ (range n) 0))
        lcnt (Counter)
        rcnt (Counter)
        popmem [])
  (qs.sort :reverse True)
  (for [i (range n)]
    (while (and qs (<= (get (get qs -1) 0) i))
      (setv [r1 c1 r2 c2] (qs.pop))
      (+= (get lcnt c1) 1)
      (+= (get rcnt c2) 1)
      (heappush popmem [r2 c1 c2]))
    
    (setv cur 0)
    (for [j (range n)]
      (+= cur (get lcnt j))
      (setv (get (get rst i) j) cur)
      (-= cur (get rcnt j)))

    (while (and popmem (<= (get (get popmem 0) 0) i))
      (setv [r2 l r] (heappop popmem))
      (-= (get lcnt l) 1)
      (-= (get rcnt r) 1)))
  rst)

(comment

  (sol 3 [[1 1 2 2] [0 0 1 1]])

  (sol 2 [[0 0 1 1]])

  )
