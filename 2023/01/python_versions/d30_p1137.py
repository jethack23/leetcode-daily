class Solution:
    def tribonacci(self, n):
        [a, b, c] = [0, 1, 1]
        if n < 2:
            _hy_anon_var_1 = n
        else:
            while n > 2:
                [a, b, c] = [b, c, a + b + c]
                n -= 1
            _hy_anon_var_1 = c
        return _hy_anon_var_1
