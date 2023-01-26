class Solution:
    def findCheapestPrice(
        self, n: int, flights: List[List[int]], src: int, dst: int, k: int
    ) -> int:
        return sol(n, flights, src, dst, k)


from collections import defaultdict, deque
from heapq import heappush, heappop
from functools import reduce


def get_graph(flights):
    rst = defaultdict(list)
    for [s, d, p] in flights:
        rst[s].append([d, p])
    return rst


def sol(n, flights, src, dst, k):
    g = get_graph(flights)
    h = [[0, src, 0]]
    stops = [n] * n
    while h:
        [cost, node, stop] = heappop(h)
        if node == dst:
            return cost
            _hy_anon_var_4 = None
        else:
            if stops[node] < stop or stop > k:
                continue
                _hy_anon_var_3 = None
            else:
                _hy_anon_var_3 = None
            _hy_anon_var_4 = _hy_anon_var_3
        stops[node] = stop
        for [nn, p] in g[node]:
            heappush(h, [p + cost, nn, stop + 1])
    return -1


None
