class Solution:
    def kthFactor(self, n: int, k: int) -> int:
        if k == 1:
            return 1
        f = 2
        cnt = 1
        while n > 1 and f <= n:
            if n % f == 0:
                cnt += 1
                if cnt == k:
                    return f
            f += 1
        return -1
