(import [functools [cache]])

(defclass Solution []
  (defn partition [self s]
    (defn palindrome? [s]
      (= s (get s (slice None None -1))))
    #@(cache
        (defn partitions [li ri]
          (setv ret (if (palindrome? (get s (slice li ri)))
                        (set [(get s (slice li ri))])
                        (set)))
          (for [i (range (+ li 1) ri)]
            (if (palindrome? (get s (slice li i)))
                (for [rp (partitions i ri)]
                  (ret.add (.join "|" [(get s (slice li i)) rp])))))
          ret))
    (lfor p (partitions 0 (len s)) (.split p "|"))))


;; class Solution:
;;     def partition(self, s):

;;         def is_palindrome(s):
;;             return s == s[slice(None, None, -1)]

;;         @cache
;;         def partitions(li, ri):
;;             ret = set([s[slice(li, ri)]]) if is_palindrome(s[slice(li, ri)]) else set()
;;             for i in range(li + 1, ri):
;;                 if is_palindrome(s[slice(li, i)]):
;;                     for rp in partitions(i, ri):
;;                         ret.add('|'.join([s[slice(li, i)], rp]))
;;                     _hy_anon_var_1 = None
;;                 else:
;;                     _hy_anon_var_1 = None
;;             return ret
;;         return [p.split('|') for p in partitions(0, len(s))]
