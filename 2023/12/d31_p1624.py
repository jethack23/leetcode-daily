def idx(c):
    return ord(c) - ord("a")


def solution(s):
    mem = [-1] * 26
    rst = -1
    for [i, c] in enumerate(s):
        if (last := mem[(j := idx(c))]) >= 0:
            rst = max(rst, i - last - 1)
        else:
            mem[j] = i
    return rst


class Solution:
    def maxLengthBetweenEqualCharacters(self, *args, **kwargs):
        return solution(*args, **kwargs)


list(map(lambda x: print(solution(*x)), [["aa"], ["abca"], ["cbzxy"]]))


# translated from below s-expression

# ;;; version: 0.1.2
# (defmacro leetcode [fnname *examples]
#   (return `(do (class Solution []
#                       (def ~fnname [self *args **kwargs]
#                         (return (solution *args **kwargs))))
#                ~(ife examples
#                      `(list (map (lambda [x] (print (solution *x)))
#                                  [~@examples]))
#                      None))))
#
# (def idx [c]
#   (return (- (ord c) (ord "a"))))
#
# (def solution [s]
#   (= mem (* [-1] 26))
#   (= rst -1)
#   (for [i c] (enumerate s)
#     (if (>= (:= last (sub mem (:= j (idx c)))) 0)
#         (= rst (max rst (- i last 1)))
#         (= (sub mem j) i)))
#   (return rst))
#
# (leetcode maxLengthBetweenEqualCharacters
#           ["aa"]
#           ["abca"]
#           ["cbzxy"])
