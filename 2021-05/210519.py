class Solution:
    def minMoves2(self, nums: List[int]) -> int:
        n = len(nums)
        nums.sort()
        l = 0
        r = n - 1
        left = nums[l]
        right = nums[r]
        while l < n and nums[l] == left:
            l += 1
        while r >= 0 and nums[r] == right:
            r -= 1
        lcnt = l
        rcnt = n - 1 - r
        ret = 0
        while left < right:
            if lcnt < rcnt:
                ret += lcnt * (nums[l] - left)
                left = nums[l]
                while l < n and left == nums[l]:
                    l += 1
                    lcnt += 1
            else:
                ret += rcnt * (right - nums[r])
                right = nums[r]
                while r >= 0 and right == nums[r]:
                    r -= 1
                    rcnt += 1
        return ret


# good solution from others
# class Solution:
#     def minMoves2(self, nums: List[int]) -> int:
#         nums.sort()
#         median = nums[len(nums) // 2]
#         min_move = 0
#         for num in nums:
#             min_move += abs(num-median)
#         return min_move
