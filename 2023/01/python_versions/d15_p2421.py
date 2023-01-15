class Solution:
    def numberOfGoodPaths(self, vals: List[int], edges: List[List[int]]) -> int:
        return sol(vals, edges)


def sol(vs, es):
    g = get_graph(es)
    l = len(vs)
    to_visit = [True] * l
    rst = 0

    def recur(node):
        nonlocal rst
        to_visit[node] = False
        nodev = vs[node]
        single_paths = Counter()
        for c in g[node]:
            if to_visit[c]:
                for [key, val] in recur(c).items():
                    if key >= nodev:
                        rst += single_paths[key] * val
                        single_paths[key] += val
                        _hy_anon_var_2 = None
                    else:
                        _hy_anon_var_2 = None
                _hy_anon_var_3 = None
            else:
                _hy_anon_var_3 = None
        single_paths[nodev] += 1
        rst += single_paths[nodev]
        return single_paths

    recur(max(g, key=lambda x: len(g[x])) if l > 2 else 0)
    return rst


def get_graph(es):
    rst = defaultdict(list)
    for [a, b] in es:
        rst[a].append(b)
        rst[b].append(a)
    return rst


None
