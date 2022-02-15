from typing import List

MOD = 10 ** 9 + 7


def c(n, k):
    if n < k:
        return 0
    ret = 1
    side = min(k, n - k)
    for i in range(side):
        ret *= (n - i) / (i + 1)
    return int(ret)


class Solution:
    def threeSumMulti(self, arr: List[int], target: int) -> int:
        mem = [0] * 101
        for n in arr:
            mem[n] += 1
        ret = 0
        for i in range(max(0, target - 200), 101):
            if mem[i] == 0:
                continue
            for j in range(max(i, target - i - 100), (target - i) // 2 + 1):
                k = target - i - j
                if mem[j] * mem[k] == 0:
                    continue
                if i == k:
                    ret += c(mem[i], 3)
                elif i == j:
                    ret += c(mem[i], 2) * mem[k]
                elif j == k:
                    ret += c(mem[j], 2) * mem[i]
                else:
                    ret += mem[i] * mem[j] * mem[k]

        return ret % MOD

