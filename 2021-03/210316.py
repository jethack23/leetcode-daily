class Solution:
    def maxProfit(self, prices: List[int], fee: int) -> int:
        n = len(prices)

        bought = prices[0] + fee
        ret = 0
        for i in range(1, n):
            if bought > prices[i] + fee:
                bought = prices[i] + fee
            elif bought < prices[i]:
                ret += prices[i] - bought
                bought = prices[i]
        return ret

