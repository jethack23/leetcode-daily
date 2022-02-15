;;; hy==1.0a4
(require hyrule *)

(import collections [deque defaultdict])

(defclass Solution []
  (defn minJumps [self arr]
    (defn compress-arr [arr]
      "remove consecutive same elements more than 3 streak"
      (setv last-val None
            rst []
            consec-added False)
      (for [a arr]
        (cond [(!= last-val a) (do (setv consec-added False)
                                   (rst.append a))]
              [(not consec-added) (do (setv consec-added True)
                                      (rst.append a))])
        (setv last-val a))
      rst)
    
    (setv arr (compress-arr arr)
          l (len arr)
          portal-address (defaultdict set)
          idx-unvisitedness (* [True] l)
          unused-portal (set arr)
          queue (deque))
    
    (for [[i v] (enumerate arr)]
      (.add (get portal-address v) i))
    (queue.append [(- l 1) (get arr -1) 0])
    (while queue
      (setv [i v s] (queue.popleft))
      (if (= i 0) (return s))
      
      ;; travel via portal
      (when (in v unused-portal)
        (unused-portal.remove v)
        (for [j (get portal-address v)]
          (when (get idx-unvisitedness j)
            (setv (get idx-unvisitedness j) False)
            (queue.append [j (get arr j) (+ s 1)]))))
      ;; travel via contiguity
      (for [j [(- i 1) (+ i 1)]]
        (when (and (< j l) (get idx-unvisitedness j))
          (setv (get idx-unvisitedness j) False)
          (queue.append [j (get arr j) (+ s 1)]))))))

