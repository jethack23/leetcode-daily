;;; hy==1.0a4
(import hyrule *)
(require hyrule *)

(defclass Solution []
  (defn myAtoi [self s]
    (defn phase1 [s]
      (.strip s))
    (defn phase2 [s]
      (if (and s (in (get s 0) "+-"))
          [(get s 0) (get s (slice 1 None))]
          ["+" s]))
    (defn phase3 [sign s]
      (for [[i c] (enumerate s)]
        (if (not (in c "1234567890"))
            (return [sign (get s (slice None i))])))
      [sign s])
    (defn phase4 [sign s]
      (* (if (= sign "+") 1 -1)
         (if s (int s) 0)))
    (defn phase5 [n]
      (setv min-int (- (** 2 31))
            max-int (- (** 2 31) 1))
      (cond [(< n min-int) min-int]
            [(> n max-int) max-int]
            [True n]))
    (as-> s x
          (phase1 x)
          (phase2 x)
          (phase3 #* x)
          (phase4 #* x)
          (phase5 x))))


;; class Solution:

;;     def myAtoi(self, s):

;;         def phase1(s):
;;             return s.strip()

;;         def phase2(s):
;;             return [s[0], s[slice(1, None)]] if s and s[0] in '+-' else ['+', s]

;;         def phase3(sign, s):
;;             for [i, c] in enumerate(s):
;;                 if not c in '1234567890':
;;                     return [sign, s[slice(None, i)]]
;;                     _hy_anon_var_6 = None
;;                 else:
;;                     _hy_anon_var_6 = None
;;             return [sign, s]

;;         def phase4(sign, s):
;;             return (1 if sign == '+' else -1) * (int(s) if s else 0)

;;         def phase5(n):
;;             min_int = -2 ** 31
;;             max_int = 2 ** 31 - 1
;;             return min_int if n < min_int else max_int if n > max_int else n if True else None
;;         x = s
;;         x = phase1(x)
;;         x = phase2(x)
;;         x = phase3(*x)
;;         x = phase4(*x)
;;         x = phase5(x)
;;         return x
