class Solution:
    def uniquePathsIII(self, g):
        return sol(g)


def sol(g):
    visited = [[True if x < 0 else False for x in row] for row in g]
    l = sum([sum([0 if x else 1 for x in row]) for row in visited])
    rst = []
    nrow = len(g)
    ncol = len(g[0])

    def recur(i, j, path):
        if is_valid(i, j):
            path.append([i, j])
            visited[i][j] = True
            if g[i][j] == 2:
                _hy_anon_var_1 = (
                    rst.append([x for x in path]) if l == len(path) else None
                )
            else:
                for [ni, nj] in get_next_coords(i, j):
                    recur(ni, nj, path)
                _hy_anon_var_1 = None
            visited[i][j] = False
            _hy_anon_var_2 = path.pop()
        else:
            _hy_anon_var_2 = None
        return len(rst)

    def is_valid(i, j):
        return 0 <= i and i < nrow and (0 <= j) and (j < ncol) and (not visited[i][j])

    return recur(*get_start_point(g), [])


def get_start_point(g):
    for [i, row] in enumerate(g):
        for [j, x] in enumerate(row):
            if x == 1:
                return [i, j]
                _hy_anon_var_3 = None
            else:
                _hy_anon_var_3 = None


def get_next_coords(i, j):
    return [[i + 1, j], [i - 1, j], [i, j + 1], [i, j - 1]]
