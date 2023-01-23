class Solution:
    def findJudge(self, n: int, trust: List[List[int]]) -> int:
        return sol(n, trust)


def sol(n, trust):
    trusts = [0] * n
    trusted = [0] * n
    rst = -1
    for [a, b] in trust:
        trusts[a - 1] += 1
        trusted[b - 1] += 1
    for [i, [to, by]] in enumerate(zip(trusts, trusted)):
        if to == 0 and by == n - 1:
            rst = i + 1
            break
            _hy_anon_var_2 = None
        else:
            _hy_anon_var_2 = None
    return rst


None
