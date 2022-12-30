class Solution:
    def allPathsSourceTarget(self, g):
        return sol(g)


def sol(g):
    rst = []

    def dfs(cur, target, path):
        path.append(cur)
        if cur == target:
            _hy_anon_var_1 = rst.append([x for x in path])
        else:
            for ncur in g[cur]:
                dfs(ncur, target, path)
            _hy_anon_var_1 = None
        return path.pop()

    dfs(0, len(g) - 1, [])
    return rst
