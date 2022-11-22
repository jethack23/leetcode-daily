;; hy==1.0a4

(import collections [deque])

(defmacro myget [g i j]
  `(get (get ~g ~i) ~j))

(defn cango? [g i j]
  (= (myget g i j) "." ))

(defn wall? [g i j]
  (= (myget g i j) "+"))

(defn boarder? [g i j m n]
  (or (= i 0) (= i (- m 1)) (= j 0) (= j (- n 1))))

(defn exit? [g i j m n]
  (and (boarder? g i j m n)
       (cango? g i j)))

(defn exit-exist? [g]
  (setv m (len g)
        n (len (get g 0)))
  (for [i [0 (- m 1)]]
    (for [j (range n)]
      (when (cango? g i j)
        (return True))))
  (for [j [0 (- n 1)]]
    (for [i (range m)]
      (when (cango? g i j)
        (return True))))
  False)

(defclass Solution []
  (defn nearestExit [self g s]
    (setv q (deque [s])
          rst 1
          (myget g (get s 0) (get s 1)) "+"
          m (len g)
          n (len (get g 0)))
    (when (exit-exist? g)
      (while q
        (setv nq (deque))
        (for [p q]
          (setv i (get p 0)
                j (get p 1))
          (for [[di dj] [[0 1] [1 0] [-1 0] [0 -1]]]
            (setv ni (min (max 0 (+ i di)) (- m 1))
                  nj (min (max 0 (+ j dj)) (- n 1)))
            (when (cango? g ni nj)
              (setv (myget g ni nj) "+")
              (if (boarder? g ni nj m n)
                  (return rst)
                  (nq.append [ni nj])))))
        (setv q nq)
        (+= rst 1)))
    -1))
