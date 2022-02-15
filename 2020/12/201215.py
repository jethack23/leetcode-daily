class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        mid = 0
        l = len(nums)
        while mid < l and nums[mid] < 0:
            mid += 1
        left = [x * x for x in nums[:mid][::-1]]
        right = [x * x for x in nums[mid:]]
        li = 0
        ri = 0
        ll = len(left)
        rl = len(right)
        ret = []
        while li < ll or ri < rl:
            if li == ll:
                ret.append(right[ri])
                ri += 1
            elif ri == rl:
                ret.append(left[li])
                li += 1
            elif right[ri] < left[li]:
                ret.append(right[ri])
                ri += 1
            else:
                ret.append(left[li])
                li += 1
        return ret
