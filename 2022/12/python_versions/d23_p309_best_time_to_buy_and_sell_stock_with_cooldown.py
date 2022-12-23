class Solution:
    def maxProfit(self, prices):
        return sol(prices)


MINIMUM = -1000


def sol(prices):
    hold = MINIMUM
    sold_1 = 0
    sold_2 = 0
    for [d, p] in enumerate(prices):
        [sold_2, sold_1, hold] = [sold_1, max(sold_1, hold + p), max(hold, sold_2 - p)]
    return sold_1
