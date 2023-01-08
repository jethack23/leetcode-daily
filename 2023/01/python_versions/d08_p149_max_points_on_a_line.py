class Solution:
    def maxPoints(self, points):
        return sol(points)


def sol(ps):
    if len(ps) == 1:
        _hy_anon_var_2 = 1
    else:
        rst = 0
        for [i, [x1, y1]] in enumerate(ps):
            cnt = defaultdict(lambda: 1)
            for [j, [x2, y2]] in enumerate(ps):
                if i != j:
                    cnt[slope(x1, y1, x2, y2)] += 1
                    _hy_anon_var_1 = None
                else:
                    _hy_anon_var_1 = None
            rst = max(rst, max(cnt.values()))
        _hy_anon_var_2 = rst
    return _hy_anon_var_2


def slope(x1, y1, x2, y2):
    dx = x2 - x1
    dy = y2 - y1
    return "vertical" if dx == 0 else dy / dx
