import functools


def solution(s, k):
    n = len(s)

    @functools.cache
    def dp(end, last, lcnt, k):
        if k < 0:
            return float("inf")
        elif end < 1:
            return 0
        elif (c := s[end - 1]) == last:
            return dp(end - 1, last, lcnt + 1, k) + (
                1 if lcnt == 1 or lcnt == 9 or lcnt == 99 else 0
            )
        else:
            return min(dp(end - 1, last, lcnt, k - 1), 1 + dp(end - 1, c, 1, k))

    return dp(n, "", 0, k)


class Solution:
    def getLengthOfOptimalCompression(self, *args, **kwargs):
        return solution(*args, **kwargs)


list(
    map(
        lambda x: print(solution(*x)),
        [["aaabcccd", 2], ["aabbaa", 2], ["aaaaaaaaaa", 0]],
    )
)


# translated from below s-expression

# ;;; commit: [feat] ast.Import
# (defmacro leetcode [fnname *examples]
#   (return `(do (class Solution []
#                       (def ~fnname [self *args **kwargs]
#                         (return (solution *args **kwargs))))
#                (list (map (lambda [x] (print (solution *x)))
#                           [~@examples])))))
#
# (defmacro cond [*body]
#   (def recur [*body]
#     (if (< (len body) 4)
#         (return `(if ~@body))
#         (do (= [test then *rest] body)
#             (return `(if ~test ~then ~(recur *rest))))))
#   (return (recur *body)))
#
#
# (import functools)
#
# (def solution [s k]
#   (= n (len s))
#   (deco functools.cache
#         (def dp [end last lcnt k]
#           (cond (< k 0)
#                 (return (float "inf"))
#
#                 (< end 1)
#                 (return 0)
#
#                 (== (:= c (sub s (- end 1))) last)
#                 (return (+ (dp (- end 1) last (+ lcnt 1) k)
#                            (ife (or (== lcnt 1)
#                                     (== lcnt 9)
#                                     (== lcnt 99))
#                                 1
#                                 0)))
#                 (return (min (dp (- end 1) last lcnt (- k 1))
#                              (+ 1 (dp (- end 1) c 1 k)))))))
#   (return (dp n "" 0 k)))
#
# (leetcode getLengthOfOptimalCompression
#           ["aaabcccd" 2]
#           ["aabbaa" 2]
