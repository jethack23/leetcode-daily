class Solution:
    def closestMeetingNode(self, edges, node1, node2):
        return sol(edges, node1, node2)


def sol(edges, node1, node2):
    def recur(node, dist, rst, visited):
        if not visited[node] and node != -1:
            visited[node] = True
            rst[node] = dist
            _hy_anon_var_1 = recur(edges[node], dist + 1, rst, visited)
        else:
            _hy_anon_var_1 = None
        return rst

    l = len(edges)
    dist1 = recur(node1, 0, [-1] * l, [False] * l)
    dist2 = recur(node2, 0, [-1] * l, [False] * l)
    saved_dist = l
    rst = -1
    for [i, [d1, d2]] in enumerate(zip(dist1, dist2)):
        if d1 != -1 and d2 != -1 and (max(d1, d2) < saved_dist):
            saved_dist = max(d1, d2)
            rst = i
            _hy_anon_var_2 = None
        else:
            _hy_anon_var_2 = None
    return rst
