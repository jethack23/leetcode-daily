class Solution:
    def numsSameConsecDiff(self, N: int, K: int) -> List[int]:
        if N == 1:
            return list(range(10))

        def fill_mem(n, k, num):
            if n < 1:
                self.mem.append(num)
                return
            if num == 0:
                for i in range(1, 10):
                    fill_mem(n - 1, k, i)
                return
            d = num % 10
            for i in range(10):
                if abs(i - d) == k:
                    fill_mem(n - 1, k, num * 10 + i)

        self.mem = []
        fill_mem(N, K, 0)
        return self.mem
