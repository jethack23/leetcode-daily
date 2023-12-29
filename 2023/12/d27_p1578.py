def solution(cs, ts):
    q = deque(zip(cs, ts))
    [lc, maxt, color_cost] = ["A", 0, 0]
    rst = 0
    while q:
        [c, t] = q.popleft()
        if lc == c:
            maxt = max(maxt, t)
            color_cost += t
        else:
            rst += color_cost - maxt
            [lc, maxt, color_cost] = [c, t, t]
    return rst + color_cost + -maxt


class Solution:
    def minCost(self, *args):
        return solution(*args)


# translated from below s-expression

# ;; commit: [fix] unary op of -
# (def solution [cs ts]
#   (= q (deque (zip cs ts)))
#   (= [lc maxt color-cost] ["A" 0 0])
#   (= rst 0)
#   (while q
#     (= [c t] (q.popleft))
#     (if (== lc c)
#         (do (= maxt (max maxt t))
#             (+= color-cost t))
#         (do (+= rst (- color-cost maxt))
#             (= [lc maxt color-cost] [c t t]))))
#   (return (+ rst color-cost -maxt)))

# (class Solution []
#        (def minCost [self *args]
#          (return (solution *args))))
