class Solution:
    def minFlipsMonoIncr(self, s: str) -> int:
        return sol(s)


class Solution:
    def minFlipsMonoIncr(self, s):
        return sol(s)


def sol(s):
    return from_int_seq(list(map(int, s)))


def from_int_seq(s):
    l = len(s)
    rcnt = l - sum(s)
    rst = rcnt
    lcnt = 0
    for b in s:
        if b:
            lcnt += 1
            _hy_anon_var_2 = None
        else:
            rcnt -= 1
            _hy_anon_var_2 = None
        rst = min(rst, lcnt + rcnt)
    return rst


None
