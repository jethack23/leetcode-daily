from typing import List


class Solution:
    def longestIncreasingPath(self, matrix: List[List[int]]) -> int:
        m = len(matrix)
        n = len(matrix[0])

        def dfs(i, j, visited, last_val=-1):
            if (
                i < 0
                or j < 0
                or i >= len(visited)
                or j >= len(visited[0])
                or matrix[i][j] <= last_val
            ):
                return 0
            elif visited[i][j]:
                return visited[i][j]

            visited[i][j] = 1
            ret = max(
                [
                    dfs(i - 1, j, visited, matrix[i][j]),
                    dfs(i + 1, j, visited, matrix[i][j]),
                    dfs(i, j + 1, visited, matrix[i][j]),
                    dfs(i, j - 1, visited, matrix[i][j]),
                ]
            )
            visited[i][j] += ret
            return visited[i][j]

        ret = 0
        visited = [[0] * n for _ in range(m)]
        for i in range(m):
            for j in range(n):
                ret = max(ret, dfs(i, j, visited))
        return ret
