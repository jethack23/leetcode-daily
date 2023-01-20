class Solution:
    def findSubsequences(self, nums):
        return sol(nums)


def sol(ns):
    smem = defaultdict(set)
    for n in ns:
        new = set()
        for k in smem:
            if k <= n:
                for s in smem[k]:
                    new.add(s + "," + str(n))
                _hy_anon_var_1 = None
            else:
                _hy_anon_var_1 = None
        smem[n].update(new)
        smem[n].add(str(n))
    return list(
        filter(
            lambda x: len(x) > 1,
            map(
                lambda x: list(map(int, x.split(","))),
                reduce(lambda x, y: x | y, smem.values()),
            ),
        )
    )


sol([4, 6, 7, 7])
