class Solution:
    def longestConsecutive(self, nums):
        nums = set(nums)
        ret = 0
        for n in nums:
            if not n - 1 in nums:
                cur = n
                s = 1
                while cur + 1 in nums:
                    cur += 1
                    s += 1
                ret = max(ret, s)
        return ret
