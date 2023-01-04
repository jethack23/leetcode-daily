class Solution:
    def minimumRounds(self, tasks):
        return sol(tasks)


def sol(ts):
    return min_rnds(Counter(ts).values())


def min_rnds(lst):
    def recu(q, rst=0):
        if not q:
            _hy_anon_var_1 = rst
        else:
            fst = q.pop()
            _hy_anon_var_1 = -1 if fst < 2 else recu(q, rst + rnds(fst))
        return _hy_anon_var_1

    return recu(deque(lst))


def rnds(t):
    return t // 3 + (1 if t % 3 else 0)
