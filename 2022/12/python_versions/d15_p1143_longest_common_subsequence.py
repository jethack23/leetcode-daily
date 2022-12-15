from functools import cache


class Solution:
    def longestCommonSubsequence(self, t1, t2):
        return sol(t1, t2)


def sol(t1, t2):
    @cache
    def cached(i, j):
        return (
            0
            if i < 1 or j < 1
            else 1 + cached(i - 1, j - 1)
            if t1[i - 1] == t2[j - 1]
            else max(cached(i - 1, j), cached(i, j - 1))
            if True
            else None
        )

    return cached(len(t1), len(t2))
