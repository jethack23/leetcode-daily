(defclass Solution []
  (defn restoreIpAddresses [self s]
    (sol s)))

(defn sol [s]
  (setv l (len s)
        rst [])
  
  (defn recur [i cur ip]
    (if (= i l)
        (when (= (len ip) 3) (rst.append (+ ip [cur])))
        (do (when (can-add? cur (get s i))
              (recur (+ i 1) (+ cur (get s i)) ip))
            (when (and cur (< (len ip) 3))
              (recur i "" (+ ip [cur])))))
    rst)
  
  (list (map (fn [x] (.join "." x)) (recur 0 "" []))))


(defn can-add? [cur d]
  (and (not (= cur "0"))
       (< (int (+ cur d)) 256)))
