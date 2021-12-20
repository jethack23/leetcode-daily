from typing import List


class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        n = len(prices)
        if not n:
            return 0

        # buy scenario
        mem1 = [0] * n
        peak = prices[n - 1]
        for i in range(n - 2, 0, -1):
            mem1[i] = max(peak - prices[i], mem1[i + 1])
            peak = max(peak, prices[i])

        # sell scenario
        mem2 = [0] * n
        low = prices[0]
        for i in range(1, n):
            mem2[i] = max(prices[i] - low, mem2[i - 1])
            low = min(low, prices[i])

        # two trade scenario
        ret = 0
        for i in range(1, n):
            ret = max(ret, mem1[i] + mem2[i])
        return ret
