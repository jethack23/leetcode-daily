class Solution:
    def coinChange(self, coins: List[int], amount: int) -> int:
        def recur(amount, coin_used, res, ind):
            c = coins[ind]
            q = amount // c
            if q + coin_used >= res:
                return res

            if amount % c == 0:
                return min(res, coin_used + q)

            if ind == 0:
                return res

            for i in range(amount // c, -1, -1):
                sub = recur(amount - i * c, coin_used + i, res, ind - 1)
                res = min(res, sub)

            return res

        coins.sort()
        res = recur(amount, 0, amount + 1, len(coins) - 1)
        return -1 if res == amount + 1 else res
