class Solution:
    def maximumBags(self, capacity, rocks, additionalRocks):
        return sol(capacity, rocks, additionalRocks)


def sol(cs, rs, adds):
    return cnt_full_bags(vacancy(cs, rs), adds)


def vacancy(cs, rs):
    return sorted([c - s for [c, s] in zip(cs, rs)], reverse=True)


def cnt_full_bags(vs, adds, cnt=0):
    return (
        cnt if not vs or adds < vs[-1] else cnt_full_bags(vs, adds - vs.pop(), cnt + 1)
    )
