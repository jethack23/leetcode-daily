class Solution:
    def differenceOfSum(self, nums):
        return sol(nums)


def sol(ns):
    return difference(sum(ns), sum(map(digit_sum, ns)))


def difference(a, b):
    return abs(a - b)


def digit_sum(n, rst=0):
    return digit_sum(n // 10, rst + n % 10) if n > 0 else rst


None
