class Solution:
    def numberOfGoodPaths(self, vals: List[int], edges: List[List[int]]) -> int:
        return sol(vals, edges)


def sol(vs, es):
    nodes_by_value = defaultdict(list)
    es = sort_edges(es, vs)
    [union, find] = get_union_find(len(vs))
    rst = 0
    for [i, v] in enumerate(vs):
        nodes_by_value[v].append(i)
    nodes_by_value = sorted(nodes_by_value.items())
    for [v, nodes] in nodes_by_value:
        while es and v == es[-1][0]:
            union(*es.pop()[-1])
        root_cnt = Counter()
        for n in nodes:
            root_cnt[find(n)] += 1
        rst += sum(map(lambda x: x * (x + 1) // 2, root_cnt.values()))
    return rst


def sort_edges(es, vs):
    return sorted(map(lambda x: [max([vs[n] for n in x]), x], es), reverse=True)


def get_union_find(n):
    parents = list(range(n))
    rank = [1] * n

    def union(x, y):
        if find(x) != find(y):
            [x, y] = [y, x] if rank[x] > rank[y] else [x, y]
            rank[find(y)] += rank[find(x)]
            parents[find(x)] = find(y)
            parents[x] = find(y)
            _hy_anon_var_2 = None
        else:
            _hy_anon_var_2 = None
        return _hy_anon_var_2

    def find(x):
        if x == parents[x]:
            _hy_anon_var_3 = x
        else:
            parents[x] = find(parents[x])
            _hy_anon_var_3 = parents[x]
        return _hy_anon_var_3

    return [union, find]


None
