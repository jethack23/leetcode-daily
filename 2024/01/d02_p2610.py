from collections import Counter


def solution(nums):
    cnt = Counter(nums)
    rst = []
    for [n, c] in cnt.items():
        while len(rst) < c:
            rst.append([])
        for l in rst[:c]:
            l.append(n)
    return rst


class Solution:
    def findMatrix(self, *args, **kwargs):
        return solution(*args, **kwargs)


# translated from below s-expression

# ;;; version: 0.1.4
# (defmacro leetcode [fnname *examples]
#   (return `(do (class Solution []
#                       (def ~fnname [self *args **kwargs]
#                         (return (solution *args **kwargs))))
#                ~(ife examples
#                      `(list (map (lambda [x] (print (solution *x)))
#                                  [~@examples]))
#                      None))))
#
# (from collections [Counter])
#
# (def solution [nums]
#   (= cnt (Counter nums))
#   (= rst [])
#   (for [n c] (cnt.items)
#     (while (< (len rst) c)
#       (rst.append []))
#     (for l (sub rst [: _ c])
#       (l.append n)))
#   (return rst))
#
# (leetcode findMatrix)
