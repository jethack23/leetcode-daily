from heapq import heappush, heappop
from typing import List


class Solution:
    def maxResult(self, nums: List[int], k: int) -> int:
        mem = [(-nums[0], 0)]
        for i, n in enumerate(nums[1:], 1):
            while mem[0][1] < i - k:
                heappop(mem)
            nums[i] += -mem[0][0]
            heappush(mem, (-nums[i], i))
        return nums[-1]
