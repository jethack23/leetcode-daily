class Solution:
    class Solution:
        def maximumCount(self, nums):
            return sol(nums)


def sol(nums):
    pc = 0
    nc = 0
    for n in nums:
        if n > 0:
            pc += 1
            _hy_anon_var_2 = None
        else:
            if n < 0:
                nc += 1
                _hy_anon_var_1 = None
            else:
                _hy_anon_var_1 = None
            _hy_anon_var_2 = _hy_anon_var_1
    return max(pc, nc)
