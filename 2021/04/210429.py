class Solution:
    def searchRange(self, nums: List[int], target: int) -> List[int]:
        return (
            [-1, -1]
            if (l := bisect_left(nums, target)) == (r := bisect_right(nums, target))
            else [l, r - 1]
        )

