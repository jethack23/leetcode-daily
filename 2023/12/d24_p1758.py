def helper(x, y):
    [a, b] = x
    [i, n] = y
    if i % 2 == n:
        return [a + 1, b]
    else:
        return [a, b + 1]


def solution(s):
    return min(reduce(helper, enumerate(map(int, s)), [0, 0]))


class Solution:
    def minOperations(self, s):
        return solution(s)


# translated from below s-expression
# commit: [feat] ast.ClassDef and ast.Pass

# (def helper [x y]
#   (= [a b] x)
#   (= [i n] y)
#   (if (== (% i 2) n)
#       (return [(+ a 1) b])
#       (return [a (+ b 1)])))
#
# (def solution [s]
#   (return (min (reduce helper
#                        (enumerate (map int s))
#                        [0 0]))))
#
#
# (class Solution []
#    (def minOperations [self s]
