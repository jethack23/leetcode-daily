class Solution:
    def maximumBags(self, capacity, rocks, additionalRocks):
        return sol(capacity, rocks, additionalRocks)


def sol(cs, rs, adds):
    cnt = 0
    for [i, r] in enumerate(rs):
        cs[i] -= r
    cs.sort(reverse=True)
    while cs and cs[-1] <= adds:
        adds -= cs.pop()
        cnt += 1
    return cnt
