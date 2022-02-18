;;; hy==1.0a4

(import collections [deque])

(defclass Solution []
  (defn removeKdigits [self num k]
    (setv rst (deque)
          mem (deque)
          cnt (* [0] 10))
    (for [d num]
      (setv d (int d))
      (mem.append d)
      (if (not k) (continue))
      (+= (get cnt d) 1)
      (when (> (len mem) k)
        (setv m ((fn [lst] (for [[i v] (enumerate lst)] (if v (return i)))) cnt))
        (while True
          (setv p (mem.popleft))
          (-= (get cnt p) 1)
          (if (= p m)
              (break)
              (-= k 1)))
        (rst.append p)))
    (while k
      (mem.pop)
      (-= k 1))
    (setv rst (+ rst mem))
    (while (and rst (= 0 (get rst 0)))
      (rst.popleft))
    (if rst
        (.join "" (map str rst))
        "0")))


(setv examples [["1432219" 3]
                ["10200" 1]
                ["10" 2]])

(for [e examples]
  (print (.removeKdigits (Solution) #* e)))

