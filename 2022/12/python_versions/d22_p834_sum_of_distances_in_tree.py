class Solution:
    def sumOfDistancesInTree(self, n, edges):
        return sol(n, edges)


def sol(n, edges):
    def bottom_up(node):
        if visited[node]:
            _hy_anon_var_1 = [0, 0]
        else:
            visited[node] = True
            from_this_node = 0
            n_including_this = 1
            for c in graph[node]:
                [f, n] = bottom_up(c)
                from_this_node += f + n
                n_including_this += n
            bu_d[node] = from_this_node
            bu_n[node] = n_including_this
            _hy_anon_var_1 = [from_this_node, n_including_this]
        return _hy_anon_var_1

    def top_down(node, till_this_node=0, n_till_this=0):
        if not visited[node]:
            visited[node] = True
            total_d = till_this_node + bu_d[node]
            rst[node] = total_d
            for c in graph[node]:
                n_till_c = n - bu_n[c]
                top_down(c, total_d + n_till_c - bu_d[c] - bu_n[c], n_till_c)
            _hy_anon_var_2 = None
        else:
            _hy_anon_var_2 = None
        return _hy_anon_var_2

    graph = edge_list_to_dict(edges)
    visited = [False] * n
    bu_d = [0] * n
    bu_n = [0] * n
    bottom_up(0)
    visited = [False] * n
    rst = [0] * n
    top_down(0)
    return rst


def edge_list_to_dict(edges):
    rst = defaultdict(set)
    for [s, e] in edges:
        rst[s].add(e)
        rst[e].add(s)
    return rst
