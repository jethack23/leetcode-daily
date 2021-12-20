def comb(n, k):
    if n < 2:
        return 0
    ret = 1
    for i in range(k + 1, n + 1):
        ret *= i
    for i in range(2, n - k + 1):
        ret //= i
    return ret


class Solution:
    def numPairsDivisibleBy60(self, time: List[int]) -> int:
        ret = 0
        mem = [0] * 60
        for s in time:
            mem[s % 60] += 1
        ret += comb(mem[0], 2) + comb(mem[30], 2)
        for i in range(1, 30):
            ret += mem[i] * mem[60 - i]
        return ret
