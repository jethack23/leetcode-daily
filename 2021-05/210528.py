from typing import List
from collections import deque


class Solution:
    def maximumUniqueSubarray(self, nums: List[int]) -> int:
        left = 0
        hash_mem = set()
        ret = 0
        subsum = 0
        for right in range(len(nums)):
            while nums[right] in hash_mem:
                subsum -= nums[left]
                hash_mem.remove(nums[left])
                left += 1
            subsum += nums[right]
            hash_mem.add(nums[right])
            ret = max(ret, subsum)
        return ret
