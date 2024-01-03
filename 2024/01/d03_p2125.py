def identity(x):
    return x


def solution(bank):
    devices = list(filter(identity, map(sum, map(lambda x: map(int, x), bank))))
    rst = 0
    for i in range(1, len(devices)):
        rst += devices[i] * devices[i - 1]
    return rst


class Solution:
    def numberOfBeams(self, *args, **kwargs):
        return solution(*args, **kwargs)


list(
    map(
        lambda x: print(solution(*x)),
        [[["011001", "000000", "010100", "001000"]], [["000", "111", "000"]]],
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
# (defmacro fn [*body]
#   (return `(lambda ~@body)))
#
# (def identity [x]
#   (return x))
#
# (def solution [bank]
#   (= devices (list (filter identity (map sum (map (fn [x] (map int x)) bank)))))
#   (= rst 0)
#   (for i (range 1 (len devices))
#     (+= rst (* (sub devices i) (sub devices (- i 1)))))
#   (return rst))
#
# (leetcode numberOfBeams
#           [["011001" "000000" "010100" "001000"]]
#           [["000" "111" "000"]])
