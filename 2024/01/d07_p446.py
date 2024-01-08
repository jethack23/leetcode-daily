from collections import defaultdict
from functools import cache


def solution(nums):
    occurence = defaultdict(list)
    for [i, n] in enumerate(nums):
        occurence[n].append(i)
    l = len(nums)
    dp = [[0] * l for _ in range(l)]
    rst = 0
    for i in range(1, l - 1):
        for j in range(i + 1, l):
            t = 2 * nums[i] - nums[j]
            if t in occurence:
                for k in occurence[t]:
                    if k >= i:
                        break
                    dp[i][j] += dp[k][i] + 1
            rst += dp[i][j]
    return rst


class Solution:
    def numberOfArithmeticSlices(self, *args, **kwargs):
        return solution(*args, **kwargs)


list(map(lambda x: print(solution(*x)), [[[2, 4, 6, 8, 10]], [[7, 7, 7, 7, 7]]]))
