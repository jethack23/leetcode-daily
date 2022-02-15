;;; hy==1.0a4

(import functools [cache])

(defclass Solution []
  (defn isMatch [self s p]
    #@(cache
        (defn recur [s p i j]
          (if (= j (len p)) (return (= i (len s))))
          (setv p-first (get p j))
          (if (and (< j (- (len p) 1)) (= (get p (+ j 1)) "*"))
              (do (for [k (range i (len s))]
                    (cond [(and (!= p-first ".") (!= (get s k) p-first))
                           (break)]
                          [(recur s p (+ k 1) (+ j 2))
                           (return True)]))
                  (recur s p i (+ j 2)))
              (and (< i (len s))
                   (if (= p-first ".")
                       True
                       (and (= p-first (get s i))))
                   (recur s p (+ i 1) (+ j 1))))))
    (recur s p 0 0)))

;; class Solution:

;;     def isMatch(self, s, p):

;;         @cache
;;         def recur(s, p, i, j):
;;             if j == len(p):
;;                 return i == len(s)
;;                 _hy_anon_var_1 = None
;;             else:
;;                 _hy_anon_var_1 = None
;;             p_first = p[j]
;;             if j < len(p) - 1 and p[j + 1] == '*':
;;                 for k in range(i, len(s)):
;;                     if p_first != '.' and s[k] != p_first:
;;                         break
;;                         _hy_anon_var_3 = None
;;                     else:
;;                         if recur(s, p, k + 1, j + 2):
;;                             return True
;;                             _hy_anon_var_2 = None
;;                         else:
;;                             _hy_anon_var_2 = None
;;                         _hy_anon_var_3 = _hy_anon_var_2
;;                 _hy_anon_var_4 = recur(s, p, i, j + 2)
;;             else:
;;                 _hy_anon_var_4 = i < len(s) and (True if p_first == '.' else p_first == s[i]) and recur(s, p, i + 1, j + 1)
;;             return _hy_anon_var_4
;;         return recur(s, p, 0, 0)
