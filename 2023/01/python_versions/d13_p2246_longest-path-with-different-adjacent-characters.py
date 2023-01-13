class Solution:
    def longestPath(self, parents, s):
        return sol(parents, s)


def sol(ps, ls):
    g = get_graph(ps, len(ls))

    def recur(node):
        max_path = 0
        paths = []
        for c in g[node]:
            [sbtr_max_path, sbtr_max_single_path] = recur(c)
            max_path = max(max_path, sbtr_max_path)
            paths.append(sbtr_max_single_path) if ls[node] != ls[c] else None
        paths.sort()
        longest = paths.pop() if paths else 0
        second_longest = paths.pop() if paths else 0
        max_path = max(max_path, 1 + longest + second_longest)
        return [max_path, 1 + longest]

    return recur(0)[0]


def get_graph(ps, n):
    rst = [[] for _ in range(n)]
    for [c, p] in enumerate(ps):
        rst[p].append(c) if p >= 0 else None
    return rst
