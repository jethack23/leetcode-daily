from collections import defaultdict
from functools import cache


def solution(nums):
    occurence = defaultdict(list)
    for [i, n] in enumerate(nums):
        occurence[n].append(i)

    @cache
    def dp(i, j):
        rst = 0
        d = nums[j] - nums[i]
        for k in filter(lambda x: x < i, occurence[nums[i] - d]):
            rst += dp(k, i) + 1
        return rst

    l = len(nums)
    rst = 0
    for i in range(1, l - 1):
        for j in range(i + 1, l):
            rst += dp(i, j)
    return rst


class Solution:
    def numberOfArithmeticSlices(self, *args, **kwargs):
        return solution(*args, **kwargs)


list(map(lambda x: print(solution(*x)), [[[2, 4, 6, 8, 10]], [[7, 7, 7, 7, 7]]]))
