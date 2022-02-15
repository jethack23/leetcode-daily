class Solution:
    def minCostClimbingStairs(self, c):
        n = len(c)
        for i in range(2, n):
            c[i] += min(c[i - 1], c[i - 2])
        return min(c[-1], c[-2])
