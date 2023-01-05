class Solution:
    def findMinArrowShots(self, points):
        return sol(points)


def sol(ps):
    ps.sort()
    rst = 0
    while ps:
        rst += 1
        [s, _] = ps.pop()
        while ps and s <= ps[-1][1]:
            ps.pop()
    return rst
