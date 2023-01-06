class Solution:
    def maxIceCream(self, costs, coins):
        return sol(costs, coins)


def sol(costs, coins):
    costs.sort()
    psum = prefix_sum(costs)
    return bisect_right(psum, coins)


def prefix_sum(costs):
    rst = []
    cur = 0
    for c in costs:
        cur += c
        rst.append(cur)
    return rst
