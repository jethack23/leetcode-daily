class Solution:
    def bestTeamScore(self, scores, ages):
        return sol(scores, ages)


def sol(scores, ages):
    dp = [0] * (1 + max(ages))
    for [s, a] in sorted(zip(scores, ages)):
        dp[a] = s + max(dp[slice(None, a + 1)])
    return max(dp)
