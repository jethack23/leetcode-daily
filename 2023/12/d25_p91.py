def reducer(x, y):
    [last_d, yesterday, today, d] = [*x, y]
    return [
        d,
        today,
        (today if 0 < d < 10 else 0) + (yesterday if 9 < last_d * 10 + d < 27 else 0),
    ]


def solution(s):
    [_, _, rst] = reduce(reducer, map(int, s), [0, 0, 1])
    return rst


class Solution:
    def numDecodings(self, s):
        return solution(s)


# translated from below s-expression
# commit: [feat] ast.IfExp

# (def reducer [x y]
#   (= [last-d yesterday today d] [*x y])
#   (return [d today (+ (ifexp (< 0 d 10) today 0)
#                       (ifexp (< 9 (+ (* last-d 10) d) 27)
#                              yesterday
#                              0))]))
#
# (def solution [s]
#   (= [_ _ rst] (reduce reducer
#                        (map int s)
#                        [0 0 1]))
#   (return rst))
#
# (class Solution []
#        (def numDecodings [self s]
