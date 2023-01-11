class Solution:
    def minTime(self, n, edges, hasApple):
        return sol(n, edges, hasApple)


def sol(n, es, is_ap):
    g = get_graph(es)
    to_visit = set(range(n))

    def recur(node):
        to_visit.remove(node)
        return reduce(
            lambda x, y: x + y,
            [calibrate(recur(nn), nn) for nn in g[node] if nn in to_visit],
            0,
        )

    def calibrate(x, node):
        return x + 2 if x > 0 or is_ap[node] else x

    return recur(0)


def get_graph(es):
    rst = defaultdict(list)
    for [f, t] in es:
        rst[f].append(t)
        rst[t].append(f)
    return rst
