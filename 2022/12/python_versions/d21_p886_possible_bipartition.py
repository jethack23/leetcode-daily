class Solution:
    def possibleBipartition(self, n, dislikes):
        return sol(n, dislikes)


def sol(n, edges):
    return not find_odd_cycle(n, edges)


def find_odd_cycle(n, edges):
    colors = dict()
    graph = edge_list_to_dict(edges)

    def recur(node, previous_color=True):
        return (
            colors[node] == previous_color
            if node in colors
            else recur_call(node, not previous_color)
        )

    def recur_call(node, this_color):
        colors[node] = this_color
        found = False
        q = deque(graph[node])
        while q and (not found):
            found = found or recur(q.pop(), this_color)
        return found

    return reduce(
        lambda x, y: x or y, [recur(i) for i in graph if not i in colors], False
    )


def edge_list_to_dict(edges):
    rst = defaultdict(set)
    for [i, j] in edges:
        rst[i].add(j)
        rst[j].add(i)
    return rst
