class Solution:
    def findJudge(self, n: int, trust: List[List[int]]) -> int:
        return sol(n, trust)


def sol(n, trust):
    point = [0] * n
    rst = -1
    for [a, b] in trust:
        point[a - 1] -= 1
        point[b - 1] += 1
    for [i, p] in enumerate(point):
        if p == n - 1:
            rst = i + 1
            break
            _hy_anon_var_2 = None
        else:
            _hy_anon_var_2 = None
    return rst


None
