class Solution:
    def numSubarrayProductLessThanK(self, nums: List[int], k: int) -> int:
        ret = 0
        n = len(nums)
        l = 0
        p = 1
        for r in range(0, n):
            p *= nums[r]
            while l <= r and p >= k:
                p //= nums[l]
                l += 1
            ret += (r - l + 1)
        return ret
            