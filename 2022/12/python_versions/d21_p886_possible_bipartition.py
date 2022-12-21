class Solution:
    def possibleBipartition(self, n, dislikes):
        return sol(n, dislikes)


def sol(n, dislikes):
    return is_bi_partite(n, dislikes)


def is_bi_partite(n, edges):
    colors = dict()
    graph = edge_list_to_dict(edges)

    def is_only_even_cycles(node, color=True):
        if node in colors:
            _hy_anon_var_1 = colors[node] == color
        else:
            colors[node] = color
            _hy_anon_var_1 = recur_call_with_early_stopping(
                deque(graph[node]), not color
            )
        return _hy_anon_var_1

    def recur_call_with_early_stopping(q, color):
        return (
            True
            if not q
            else False
            if not is_only_even_cycles(q.pop(), color)
            else recur_call_with_early_stopping(q, color)
            if True
            else None
        )

    return reduce(
        lambda x, y: x and y,
        [is_only_even_cycles(i) for i in graph if not i in colors],
        True,
    )


def edge_list_to_dict(edges):
    rst = defaultdict(set)
    for [i, j] in edges:
        rst[i].add(j)
        rst[j].add(i)
    return rst
