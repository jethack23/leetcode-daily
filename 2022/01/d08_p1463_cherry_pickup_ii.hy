(import [typing [List]]
        [functools [cache]])

(defclass Solution []
  (defn ^int cherryPickup [self ^(get List (get List int)) grid]
    (setv m (len grid)
          n (len (get grid 0)))
    (with-decorator cache
      (defn max-cherries [r i j]
        (setv row (get grid r))
        (+ (get row i) (get row j)
           (if (= r (- m 1))
               0
               (max (lfor k (range (max 0 (- i 1)) (min (- n 1) (+ i 2)))
                          (max (lfor l (range (max (+ k 1) (- j 1)) (min n (+ j 2)))
                                     (max-cherries (+ r 1) k l)))))))))
    (max-cherries 0 0 (- n 1))))


;; class Solution:

;;     def cherryPickup(self, grid: List[List[int]]) -> int:
;;         m = len(grid)
;;         n = len(grid[0])

;;         @cache
;;         def max_cherries(r, i, j):
;;             row = grid[r]
;;             return row[i] + row[j] + (0 if r == m - 1 else max([max([max_cherries(r + 1, k, l) for l in range(max(k + 1, j - 1), min(n, j + 2))]) for k in range(max(0, i - 1), min(n - 1, i + 2))]))
;;         return max_cherries(0, 0, n - 1)
