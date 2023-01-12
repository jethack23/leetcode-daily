class Solution:
    def countSubTrees(self, n, edges, labels):
        return sol(n, edges, labels)


def sol(n, es, ls):
    not_visit = [True] * n
    rst = [0] * n
    g = get_graph(es)

    def recur(node):
        not_visit[node] = False
        cnt = reduce(
            lambda x, y: x + y,
            [recur(nn) for nn in g[node] if not_visit[nn]],
            Counter(),
        )
        cnt[ls[node]] += 1
        rst[node] = cnt[ls[node]]
        return cnt

    recur(0)
    return rst


def get_graph(es):
    rst = defaultdict(list)
    for [a, b] in es:
        rst[a].append(b)
        rst[b].append(a)
    return rst
