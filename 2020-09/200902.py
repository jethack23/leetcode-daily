def bisearch(lst, x):
    l = 0
    r = len(lst)
    while l < r:
        m = (l + r) // 2
        if lst[m] < x:
            l = m + 1
        else:
            r = m
    return l

class Solution:
    def containsNearbyAlmostDuplicate(self, nums: List[int], k: int, t: int) -> bool:
        mem = []
        for i in range(len(nums)):
            val = nums[i]
            pos = bisearch(mem, val)
            if (pos < len(mem) and mem[pos] - val <= t): return True
            elif (pos > 0 and val - mem[pos - 1] <= t): return True
            mem.insert(pos, val)
            if (i >= k): mem.pop(bisearch(mem, nums[i-k]))