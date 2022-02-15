class Solution:
    def maxAreaOfIsland(self, g):
        m = len(g)
        n = len(g[0])
        visited = [[False] * n for _ in range(m)]

        def dfs(i, j):
            if not g[i][j] or visited[i][j]:
                return 0

            visited[i][j] = True
            ret = 1
            if i > 0:
                ret += dfs(i - 1, j)
            if i < m - 1:
                ret += dfs(i + 1, j)
            if j > 0:
                ret += dfs(i, j - 1)
            if j < n - 1:
                ret += dfs(i, j + 1)
            return ret

        ret = 0
        for i in range(m):
            for j in range(n):
                if visited[i][j] or not g[i][j]:
                    continue
                ret = max(ret, dfs(i, j))
        return ret
