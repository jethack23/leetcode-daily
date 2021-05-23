# used official solution


class Solution:
    def shortestSuperstring(self, words: List[str]) -> str:
        n = len(words)

        overlaps = [[0] * n for _ in range(n)]
        for i, w in enumerate(words):
            for j, v in enumerate(words):
                if i != j:
                    for pos in range(min(len(w), len(v)), -1, -1):
                        if v.startswith(w[-pos:]):
                            overlaps[i][j] = pos
                            break

        mem = [[0] * n for _ in range(1 << n)]
        parent = [[None] * n for _ in range(1 << n)]

        for mask in range(1, 1 << n):
            for bit in range(n):
                if (mask >> bit) & 1:
                    pmask = mask ^ (1 << bit)
                    if pmask == 0:
                        continue
                    for i in range(n):
                        if (pmask >> i) & 1:
                            if (value := mem[pmask][i] + overlaps[i][bit]) >= mem[mask][
                                bit
                            ]:
                                mem[mask][bit] = value
                                parent[mask][bit] = i

        perm = []
        mask = (1 << n) - 1
        i = max(range(n), key=lambda i: mem[-1][i])
        while i is not None:
            perm.append(i)
            mask, i = mask ^ (1 << i), parent[mask][i]

        perm = perm[::-1]

        ans = words[perm[0]]
        for i in range(1, len(perm)):
            ans += words[perm[i]][overlaps[perm[i - 1]][perm[i]] :]

        return ans


# bug solution
class Solution:
    def shortestSuperstring(self, words: List[str]) -> str:
        return words
