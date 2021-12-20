from typing import List


def dfs(mat, i, j, mem, m, n, last=-1):
    if mem[i][j] == 1 or mat[i][j] < last:
        return
    mem[i][j] = 1

    this = mat[i][j]
    # left
    if i > 0:
        dfs(mat, i - 1, j, mem, m, n, this)
    # right
    if i < m - 1:
        dfs(mat, i + 1, j, mem, m, n, this)
    # top
    if j > 0:
        dfs(mat, i, j - 1, mem, m, n, this)
    # bottom
    if j < n - 1:
        dfs(mat, i, j + 1, mem, m, n, this)


class Solution:
    def pacificAtlantic(self, matrix: List[List[int]]) -> List[List[int]]:
        m = len(matrix)
        if not m:
            return []
        else:
            n = len(matrix[0])
        if not n:
            return []

        from_p = [[0] * n for _ in range(m)]
        from_a = [[0] * n for _ in range(m)]

        # top-side
        for j in range(n):
            dfs(matrix, 0, j, from_p, m, n)
        # left-side
        for i in range(m):
            dfs(matrix, i, 0, from_p, m, n)
        # right-side
        for i in range(m):
            dfs(matrix, i, n - 1, from_a, m, n)
        # bottom-side
        for j in range(n):
            dfs(matrix, m - 1, j, from_a, m, n)

        res = []
        for i in range(m):
            for j in range(n):
                if from_p[i][j] and from_a[i][j]:
                    res.append([i, j])

        return res
