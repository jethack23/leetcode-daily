class Solution:
    def minimumRounds(self, tasks):
        return sol(tasks)


def sol(ts):
    return min_rnds(Counter(ts).values())


def min_rnds(lst, rst=0):
    for t in lst:
        if t < 2:
            return -1
            _hy_anon_var_1 = None
        else:
            rst += rnds(t)
            _hy_anon_var_1 = None
    return rst


def rnds(t):
    return t // 3 + (1 if t % 3 else 0)
