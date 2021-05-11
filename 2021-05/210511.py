class Solution:
    def maxScore(self, C: List[int], k: int) -> int:
        cur = sum(C[-k:])
        ret = cur
        for i in range(0, k):
            cur += C[i] - C[-k + i]
            ret = max(ret, cur)
        return ret
