class Solution:
    def maxProfit(self, prices: List[int]) -> int:
        n = len(prices)
        if n < 2:
            return 0
        elif n == 2:
            return max(0, prices[-1] - prices[-2])
        mem = [0] * n
        mem[-2] = max(0, prices[-1] - prices[-2])
        mem[-3] = max([0, prices[-1] - prices[-3], prices[-2] - prices[-3]])

        for i in range(-4, -n - 1, -1):
            mem[i] = max(
                [mem[i + 2], mem[i + 1] + prices[i + 1] - prices[i], mem[i + 3]]
            )

        return max(mem[0], mem[1])
