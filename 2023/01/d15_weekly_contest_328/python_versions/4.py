class Solution:
    def maxOutput(self, n: int, edges: List[List[int]], price: List[int]) -> int:
        return sol(n, edges, price)


def sol(n, edges, price):
    g = get_graph(edges)
    to_visit = [True] * n
    rst = 0

    def recur(n):
        nonlocal rst
        to_visit[n] = False
        p = price[n]
        csreturns = [[c, recur(c)] for c in g[n] if to_visit[c]]

        def _hy_anon_var_2(x):
            [c, [m, mne]] = x
            return [m, c]

        max_sorted = sorted(map(_hy_anon_var_2, csreturns))

        def _hy_anon_var_3(x):
            [c, [m, mne]] = x
            return [mne, c]

        mne_sorted = sorted(map(_hy_anon_var_3, csreturns))
        [fmax, fmi] = max_sorted.pop() if max_sorted else [0, -1]
        [fmne, fnei] = mne_sorted.pop() if mne_sorted else [-p, -2]
        if fmi != fnei:
            _hy_anon_var_4 = p + fmax + fmne
        else:
            [smax, _] = max_sorted.pop() if max_sorted else [0, -1]
            [smne, _] = mne_sorted.pop() if mne_sorted else [-p, -2]
            _hy_anon_var_4 = p + max(fmax + smne, smax + fmne)
        rst = max(rst, _hy_anon_var_4)
        return [p + fmax, p + fmne]

    recur(0)
    return rst


def get_graph(es):
    rst = defaultdict(list)
    for [a, b] in es:
        rst[a].append(b)
        rst[b].append(a)
    return rst


None
