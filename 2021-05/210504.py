class Solution:
    def checkPossibility(self, nums: List[int]) -> bool:
        cnt = 1
        n = len(nums)
        for i in range(n - 1):
            if nums[i] > nums[i+1]:
                if cnt == 0:
                    return False
                if 0 < i < n - 2 and nums[i-1] > nums[i+1] and nums[i] > nums[i+2]:
                    return False
                cnt -= 1
        return True