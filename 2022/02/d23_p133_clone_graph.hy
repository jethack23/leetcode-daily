;;; hy==1.0a4

(import collections [defaultdict])

(defclass Solution []
  (defn cloneGraph [self node]
    "Using defaultdict"
    (if (is node None) (return None))
    (setv nodes (defaultdict Node)
          visited (set))
    (defn dfs [node]
      (visited.add node.val)
      (setv copied (get nodes node.val)
            copied.val node.val
            copied.neighbors (lfor n node.neighbors (get nodes n.val)))
      (for [n node.neighbors]
        (if (not (in n.val visited))
            (dfs n))))
    (dfs node)
    (get nodes 1))
  
  (defn cloneGraph [self node]
    "Using List"
    (if (is node None) (return None))
    (setv nodes (lfor i (range 101) (Node i))
          visited (* [False] 101))
    (defn dfs [node]
      (setv (get visited node.val) True
            (. (get nodes node.val) neighbors) (lfor n node.neighbors (get nodes n.val)))
      (for [n node.neighbors]
        (if (not (get visited n.val))
            (dfs n))))
    (dfs node)
    (get nodes 1)))
