from collections import defaultdict, deque
from functools import reduce


class Solution:
    def validPath(self, n, edges, source, destination):
        return sol(edges, source, destination)


def sol(edges, source, destination):
    visited = set()
    edge_dict = edge_list_to_dict(edges)

    def recur(source, destination):
        if source in visited:
            _hy_anon_var_1 = False
        else:
            visited.add(source)
            _hy_anon_var_1 = (
                True
                if source == destination or destination in edge_dict[source]
                else dfs_call(edge_dict[source], destination)
            )
        return _hy_anon_var_1

    def dfs_call(start_set, destination):
        found = False
        q = deque(start_set)
        while not found and q:
            found = found or recur(q.pop(), destination)
        return found

    return recur(source, destination)


def edge_list_to_dict(edges):
    rst = defaultdict(set)
    for [i, j] in edges:
        rst[i].add(j)
        rst[j].add(i)
    return rst
