(import [functools [cache]])

(defclass Solution []
  (defn mergeStones [self stones k]
    (setv stride (- k 1)
          length (len stones)
          pfsum (+ [0] stones))
    (for [i (range length)]
      (+= (get pfsum (+ i 1)) (get pfsum i)))
    (if (% (- length 1) stride) (return -1))
    #@(cache
        (defn cost [l r]
          (if (< (- r l) k)
              0
              (do (setv num-steps (// (- r l 2) stride)
                        ret (min (lfor i (range 2) (cost (+ l i) (+ i (- r 1))))))
                  (for [i (range (+ l k) (- r k -1))]
                    (if (= (+ (// (- i l 1) stride)
                              (// (- r i 1) stride))
                           num-steps)
                        (setv ret (min ret (+ (cost l i)
                                              (cost i r))))))
                  (if (= (% (- r l 1) stride) 0)
                      (+ ret (- (get pfsum r) (get pfsum l)))
                      ret)))))
    (cost 0 length)))


;; class Solution:

;;     def mergeStones(self, stones, k):
;;         stride = k - 1
;;         length = len(stones)
;;         pfsum = [0] + stones
;;         for i in range(length):
;;             pfsum[i + 1] += pfsum[i]
;;         if (length - 1) % stride:
;;             return -1
;;             _hy_anon_var_1 = None
;;         else:
;;             _hy_anon_var_1 = None

;;         @cache
;;         def cost(l, r):
;;             if r - l < k:
;;                 _hy_anon_var_3 = 0
;;             else:
;;                 num_steps = (r - l - 2) // stride
;;                 ret = min([cost(l + i, i + (r - 1)) for i in range(2)])
;;                 for i in range(l + k, r - k - -1):
;;                     if (i - l - 1) // stride + (r - i - 1) // stride == num_steps:
;;                         ret = min(ret, cost(l, i) + cost(i, r))
;;                         _hy_anon_var_2 = None
;;                     else:
;;                         _hy_anon_var_2 = None
;;                 _hy_anon_var_3 = ret + (pfsum[r] - pfsum[l]) if (r - l - 1) % stride == 0 else ret
;;             return _hy_anon_var_3
;;         return cost(0, length)
