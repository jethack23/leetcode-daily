class Solution:
    def maxProfit(self, prices):
        return sol(prices)


MINIMUM = 5000 * -1000


def sol(prices):
    hold = []
    sold = []
    for [d, p] in enumerate(prices):
        sm = 0 if d < 1 else max(sold[-1], hold[-1] + p)
        hm = max(MINIMUM if d < 1 else hold[-1], (0 if d < 2 else sold[-2]) - p)
        hold.append(hm)
        sold.append(sm)
    return sold[-1]


sol([1])
