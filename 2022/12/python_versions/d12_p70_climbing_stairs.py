class Solution:
    def climbStairs(self, n):
        return sol(n)


def sol(n):
    return fib(n)


def fib(n, a=0, b=1):
    return b if n == 0 else fib(n - 1, b, a + b)
