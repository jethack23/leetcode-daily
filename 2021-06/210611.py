class Solution:
    def stoneGameVII(self, S):
        n = len(S)
        mem = [0] * (n + 1)
        for i in range(n):
            mem[i + 1] = mem[i] + S[i]
        dp = [[0] * (n + 1) for _ in range(n + 1)]
        initial = n % 2
        for i in range(n, -1, -1):
            for j in range(i, n + 1):
                m = j - i
                if m < 2:
                    dp[i][j] = 0
                    continue
                if m % 2 == initial:
                    dp[i][j] = max(
                        dp[i + 1][j] + mem[j] - mem[i + 1],
                        dp[i][j - 1] + mem[j - 1] - mem[i],
                    )
                else:
                    dp[i][j] = min(
                        dp[i + 1][j] - mem[j] + mem[i + 1],
                        dp[i][j - 1] - mem[j - 1] + mem[i],
                    )
        return dp[0][n]

