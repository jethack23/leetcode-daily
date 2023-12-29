import functools


def solution(js, d):
    n = len(js)

    @functools.cache
    def dp(done, d, tmax):
        if done < d:
            return float("inf")
        elif done == 0:
            return 0
        else:
            return min(
                (j := js[done - 1]) + dp(done - 1, d - 1, j),
                max(0, j - tmax) + dp(done - 1, d, max(tmax, j)),
            )

    return x if isinstance((x := dp(n, d, 0)), int) else -1


class Solution:
    def minDifficulty(self, *args, **kwargs):
        return solution(*args, **kwargs)


list(
    map(
        lambda x: print(solution(*x)),
        [[[6, 5, 4, 3, 2, 1], 2], [[9, 9, 9], 4], [[1, 1, 1], 3]],
    )
)


# translated from below s-expression

# ;;; commit: [feat] ast.Import
# (defmacro leetcode [fnname *examples]
#   (return `(do (class Solution []
#                       (def ~fnname [self *args **kwargs]
#                         (return (solution *args **kwargs))))
#                ~(ife examples
#                      `(list (map (lambda [x] (print (solution *x)))
#                                  [~@examples]))
#                      None))))
#
# (defmacro cond [*body]
#   (def recur [*body]
#     (if (< (len body) 4)
#         (return `(if ~@body))
#         (do (= [test then *rest] body)
#             (return `(if ~test ~then ~(recur *rest))))))
#   (return (recur *body)))
#
# (import functools)
#
# (def solution [js d]
#   (= n (len js))
#   (deco functools.cache
#      (def dp [done d tmax]
#        (cond (< done d)
#              (return (float "inf"))
#
#              (== done 0)
#              (return 0)
#
#              (return
#                (min (+ (:= j (sub js (- done 1)))
#                        (dp (- done 1) (- d 1) j)) ; do it today
#                     (+ (max 0 (- j tmax))
#                        (dp (- done 1) d (max tmax j))) ; do it tomorrow
#                     )))))
#   (return (ife (isinstance (:= x (dp n d 0)) int) x -1)))
#
# (leetcode minDifficulty
#           [[6 5 4 3 2 1] 2]
#           [[9 9 9] 4]
#           [[1 1 1] 3])
