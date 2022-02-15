class Solution:
    def minDistance(self, word1: str, word2: str) -> int:
        m = len(word1)
        n = len(word2)
        mem = [[0] * (n + 1) for _ in range(2)]
        i = 0
        for k in range(m):
            i ^= 1
            for j in range(n):
                if word1[k] == word2[j]:
                    mem[i][j] = 1 + mem[i - 1][j - 1]
                else:
                    mem[i][j] = max(mem[i - 1][j], mem[i][j - 1])
        return m + n - 2 * mem[i][n - 1]
