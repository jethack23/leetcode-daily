class Solution:
    def canFinish(self, n, prerequisites):
        return sol(n, prerequisites)


def sol(n, prerequisites):
    visited = [False] * n
    g = get_graph(n, prerequisites)

    def recur(node, in_search):
        if node in in_search:
            _hy_anon_var_3 = False
        else:
            if visited[node]:
                _hy_anon_var_2 = True
            else:
                if True:
                    in_search.add(node)
                    visited[node] = True
                    rst = reduce(
                        lambda x, y: x and y,
                        [recur(c, in_search) for c in g[node]],
                        True,
                    )
                    in_search.remove(node)
                    _hy_anon_var_1 = rst
                else:
                    _hy_anon_var_1 = None
                _hy_anon_var_2 = _hy_anon_var_1
            _hy_anon_var_3 = _hy_anon_var_2
        return _hy_anon_var_3

    return reduce(lambda x, y: x and y, [recur(i, set()) for i in range(n)], True)


def get_graph(n, edges):
    g = [[] for i in range(n)]
    for [p, c] in edges:
        g[c].append(p)
    return g


sol(2, [[1, 0]])
sol(2, [[1, 0], [0, 1]])
