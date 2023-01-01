;;; hy==0.25

(defclass Solution []
  (defn wordPattern [self pattern s]
    (sol pattern s)))

(defn sol [p s]
  (check-pattern (list p) (s.split) {} {}))

(defn check-pattern [p s inj surj]
  (cond

    (or (not p) (not s))
    (and (not p) (not s))

    (or (in (get p -1) inj)
        (in (get s -1) surj))
    (if (bijection-check (p.pop) (s.pop) inj surj)
        (check-pattern p s inj surj)
        False)

    True
    (do (mem-update (p.pop) (s.pop) inj surj)
        (check-pattern p s inj surj))))


(defn bijection-check [pe se inj surj]
  (and (in pe inj)
       (= (get inj pe) se)
       (in se surj)
       (= (get surj se) pe)))

(defn mem-update [pe se inj surj]
  (inj.update {pe se})
  (surj.update {se pe}))

