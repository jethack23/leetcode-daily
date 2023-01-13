class Solution:
    def longestPath(self, parents, s):
        return sol(parents, s)


def sol(ps, ls):
    g = get_graph(ps)
    rst = 0

    def recur(node):
        nonlocal rst
        paths = []
        for c in g[node]:
            recur(c) if ls[node] == ls[c] else paths.append(recur(c))
        paths.sort()
        longest = paths.pop() if paths else 0
        second_longest = paths.pop() if paths else 0
        rst = max(rst, 1 + longest + second_longest)
        return 1 + longest

    recur(0)
    return rst


def get_graph(ps):
    rst = defaultdict(list)
    for [n, p] in enumerate(ps):
        rst[p].append(n)
    return rst
