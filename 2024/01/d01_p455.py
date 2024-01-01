def solution(g, s):
    g.sort(reverse=True)
    s.sort(reverse=True)
    rst = 0
    while g and s:
        if g[-1] <= s[-1]:
            rst += 1
            g.pop()
        s.pop()
    return rst


class Solution:
    def findContentChildren(self, *args, **kwargs):
        return solution(*args, **kwargs)


# translated from below s-expression

# ;;; version: 0.1.3
#
# (defmacro leetcode [fnname *examples]
#   (return `(do (class Solution []
#                       (def ~fnname [self *args **kwargs]
#                         (return (solution *args **kwargs))))
#                ~(ife examples
#                      `(list (map (lambda [x] (print (solution *x)))
#                                  [~@examples]))
#                      None))))
#
# (def solution [g s]
#   (g.sort :reverse True)
#   (s.sort :reverse True)
#   (= rst 0)
#   (while (and g s)
#     (do (if (<= (sub g -1) (sub s -1))
#             (do (+= rst 1)
#                 (g.pop)))
#         (s.pop)))
#   (return rst))
#
# (leetcode findContentChildren)
