@cache
def solution(n, k, target):
    if n == 0:
        return 1 if target == 0 else 0
    rst = 0
    i = 1
    while i <= k:
        rst = rst + solution(n - 1, k, target - i)
        i = i + 1
    return rst


class Solution:
    def numRollsToTarget(self, *args):
        return solution(*args) % 1000000007


# translated from below s-expression
# commit: [feat] repl with multi-line input

# (defmacro += [target value]
#   (return `(= ~target (+ ~target ~value))))
#
# (deco cache
#       (def solution [n k target]
#         (if (== n 0) (return (ifexp (== target 0) 1 0)))
#         (= rst 0)
#         (= i 1)
#         (while (<= i k)
#           (+= rst (solution (- n 1)
#                             k
#                             (- target i)))
#           (+= i 1))
#         (return rst)))
#
# (class Solution []
#        (def numRollsToTarget [self *args]
#          (return (% (solution *args)
