from typing import List

class Solution:
    def maximumGap(self, nums: List[int]) -> int:
        nums = list(set(nums))
        l = len(nums)
        if l < 2:
            return 0
        m = min(nums)
        M = max(nums)
        bin_size = (M - m) // (l -1)
        mem = [[None, None] for _ in range((M - m) // bin_size + 1)]
        for n in nums:
            i = (n - m) // bin_size
            bin_m = n if mem[i][0] is None else min(mem[i][0], n)
            bin_M = n if mem[i][0] is None else max(mem[i][1], n)
            mem[i] = bin_m, bin_M
        mem = [x for x in mem if not x[0] is None]
        ret = 0
        for i in range(len(mem)-1):
            ret = max(ret, mem[i+1][0] - mem[i][1])
        return ret