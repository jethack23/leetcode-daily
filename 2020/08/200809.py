class Solution:
    def orangesRotting(self, grid: List[List[int]]) -> int:
        def step(grid):
            n = len(grid)
            m = len(grid[0])
            newg = [[f for f in row] for row in grid]
            changed = False
            for i in range(n):
                for j in range(m):
                    if grid[i][j] == 2:
                        # north
                        if i > 0 and grid[i - 1][j] == 1:
                            changed = True
                            newg[i - 1][j] = 2
                        # east
                        if j < m - 1 and grid[i][j + 1] == 1:
                            changed = True
                            newg[i][j + 1] = 2
                        # west
                        if j > 0 and grid[i][j - 1] == 1:
                            changed = True
                            newg[i][j - 1] = 2
                        # south
                        if i < n - 1 and grid[i + 1][j] == 1:
                            changed = True
                            newg[i + 1][j] = 2
            return newg, changed

        changed = True
        cnt = -1
        while changed:
            cnt += 1
            grid, changed = step(grid)
        for row in grid:
            for f in row:
                if f == 1:
                    return -1
        return cnt
