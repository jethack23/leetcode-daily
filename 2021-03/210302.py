class Solution:
    def findErrorNums(self, nums: List[int]) -> List[int]:
        S = sum(nums)
        n = len(nums)
        diff = n * (n + 1) // 2 - S

        nums = sorted(nums)

        ret = -1
        for i in range(n - 1):
            if nums[i] == nums[i + 1]:
                ret = nums[i]
                break

        return ret, ret + diff
