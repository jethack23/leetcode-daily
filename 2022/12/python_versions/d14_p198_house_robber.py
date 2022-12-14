class Solution:
    def rob(self, nums):
        return sol(nums)


def sol(nums):
    def recur(a, b):
        return b if not nums else recur(b, max(nums.pop() + a, b))

    return recur(0, 0)
