from collections import Counter


def solution(ss):
    return all(
        map(lambda x: x % len(ss) == 0, sum(map(Counter, ss), Counter()).values())
    )


class Solution:
    def makeEqual(self, *args, **kwargs):
        return solution(*args, **kwargs)


list(map(lambda x: print(solution(*x)), [[["abc", "aabc", "bc"]], [["ab", "a"]]]))


# translated from below s-expression

# ;;; version 0.1.1
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
# (from collections [Counter])
#
# (def solution [ss]
#   (return (all (map (lambda [x] (== (% x (len ss)) 0))
#                     (.values (sum (map Counter ss)
#                                   (Counter)))))))
#
# (leetcode makeEqual
#           [["abc" "aabc" "bc"]]
#           [["ab" "a"]])
