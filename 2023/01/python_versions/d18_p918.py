class Solution:
    def maxSubarraySumCircular(self, nums: List[int]) -> int:
        return sol(nums)


def get_psum(nums):
    psum = []
    cur = 0
    for _ in range(2):
        for n in nums:
            cur += n
            psum.append(cur)
    return psum


def sol(nums):
    psum = get_psum(nums)
    hist = [[0, -1]]
    rst = sum(nums)
    l = len(nums)
    for [i, s] in enumerate(psum):
        while hist and i - hist[0][1] > l:
            heappop(hist)
        rst = max(rst, s - hist[0][0])
        heappush(hist, [s, i])
    return rst


None
