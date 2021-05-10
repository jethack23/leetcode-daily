class Solution:
    def countPrimes(self, n: int) -> int:
        if n <= 2:
            return 0
        mem = [0, 0] + [1] * (n - 2)
        for i in range(2, int(sqrt(n)) + 1):
            if mem[i] != 0:
                mem[i * i : n : i] = [0] * ((n - 1 - i * i + i) // i)
        return sum(mem)
