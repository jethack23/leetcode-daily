;;; hy==1.0a4

;;; based on the official solution description.
;;; https://leetcode.com/problems/shortest-path-visiting-all-nodes/solution/

(import collections [deque])

(defclass Solution []
  (defn shortestPathLength [self graph]
    "BFS, faster"
    (setv q (deque)
          n (len graph)
          endmask (- (<< 1 n) 1)
          visited (set))
    (if (= n 1) (return 0))
    (for [i (range n)]
      (q.append [(, i (<< 1 i)) 0])
      (visited.add (, i (<< 1 i))))
    (while q
      (setv [[node mask] step] (q.popleft))
      (for [i (get graph node)]
        (setv nmask (| mask (<< 1 i))
              nstate (, i nmask))
        (if (= nmask endmask)
            (return (+ step 1)))
        (when (not (in nstate visited))
          (visited.add nstate)
          (q.append [nstate (+ step 1)])))))
  
  (defn shortestPathLength-dfs [self graph]
    "DFS, slower"
    (setv n (len graph)
          endmask (- (<< 1 n) 1)
          memo (dict))
    (if (= n 1) (return 0))
    (defn dfs [node mask]
      (if (= 0 (& mask (- mask 1)))
          (return 0))
      (setv state (, node mask))
      (if (in state memo)
          (return (get memo state)))
      (setv rst (float "inf")
            (get memo state) rst)
      (for [i (get graph node)]
        (if (& mask (<< 1 i))
            (setv rst (min rst
                           (+ 1 (min (dfs i mask)
                                     (dfs i (^ mask (<< 1 node)))))))))
      (setv (get memo state) rst)
      rst)
    (min (lfor i (range n) (dfs i endmask)))))


(setv egs [(py "[[1,2,3],[0],[0],[0]]")
           (py "[[1],[0,2,4],[1,3,4],[2],[1,2]]")]
      s (Solution))

(for [e egs]
  (print (.shortestPathLength s e)))
