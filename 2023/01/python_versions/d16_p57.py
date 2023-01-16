class Solution:
    def insert(
        self, intervals: List[List[int]], newInterval: List[int]
    ) -> List[List[int]]:
        return sol(intervals, newInterval)


def sol(itvs, newi):
    rst = []
    itvs = deque(itvs)
    while itvs and itvs[0][-1] < newi[0]:
        rst.append(itvs.popleft())
    while itvs and is_overlap(itvs[0], newi):
        newi = merge(newi, itvs.popleft())
    rst.append(newi)
    while itvs:
        rst.append(itvs.popleft())
    return rst


def is_overlap(i1, i2):
    [xs, ys] = list(zip(i1, i2))
    return not min(ys) < max(xs)


def merge(i1, i2):
    [xs, ys] = list(zip(i1, i2))
    return [min(xs), max(ys)]


None
