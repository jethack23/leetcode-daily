class Solution:
    def maxSubarraySumCircular(self, nums: List[int]) -> int:
        return sol(nums)


def get_psum(nums):
    psum = []
    cur = 0
    for n in nums:
        cur += n
        psum.append(cur)
    return psum


def sol(nums):
    psum = get_psum(nums)
    total = psum[-1]
    curmin = 0
    curmax = psum[0]
    rst = curmax
    for s in psum:
        rst = max(rst, s - curmin, curmax + (total - s))
        curmin = min(curmin, s)
        curmax = max(curmax, s)
    return rst


None
