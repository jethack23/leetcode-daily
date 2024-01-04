from collections import Counter


def solution(nums):
    rst = 0
    for c in Counter(nums).values():
        [q, r] = [c // 3, c % 3]
        if not r:
            rst += q
        elif r == 2:
            rst += q + 1
        elif q and r == 1:
            rst += q + 1
        else:
            return -1
    return rst


class Solution:
    def minOperations(self, *args, **kwargs):
        return solution(*args, **kwargs)


list(
    map(
        lambda x: print(solution(*x)),
        [[[2, 3, 3, 2, 2, 4, 2, 3, 4]], [[2, 1, 2, 2, 3, 3]]],
    )
)


# translated from below s-expression

# ;;; version: 0.1.5
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
#     (= [test then *orelse] body)
#     (if (< (len body) 4)
#         (return `(if ~test ~then ~@orelse))
#         (return `(if ~test ~then ~(recur *orelse)))))
#   (return (recur *body)))
#
# (from collections [Counter])
#
# (def solution [nums]
#   (= rst 0)
#   (for c (.values (Counter nums))
#     (= [q r] [(// c 3) (% c 3)])
#     (cond (not r)
#           (+= rst q)
#
#           (== r 2)
#           (+= rst (+ q 1))
#
#           (and q (== r 1))
#           (+= rst (+ q 1))
#
#           (return -1)))
#   (return rst))
#
# (leetcode minOperations
#           [[2 3 3 2 2 4 2 3 4]]
#           [[2 1 2 2 3 3]])
