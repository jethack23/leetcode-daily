class Solution:
    def rangeAddQueries(self, n, qs):
        return sol(n, qs)


def sol(n, qs):
    rst = [[0 for _ in range(n)] for _ in range(n)]
    lcnt = Counter()
    rcnt = Counter()
    popmem = []
    qs.sort(reverse=True)
    for i in range(n):
        while qs and qs[-1][0] <= i:
            [r1, c1, r2, c2] = qs.pop()
            lcnt[c1] += 1
            rcnt[c2] += 1
            heappush(popmem, [r2, c1, c2])
        cur = 0
        for j in range(n):
            cur += lcnt[j]
            rst[i][j] = cur
            cur -= rcnt[j]
        while popmem and popmem[0][0] <= i:
            [r2, l, r] = heappop(popmem)
            lcnt[l] -= 1
            rcnt[r] -= 1
    return rst


None
