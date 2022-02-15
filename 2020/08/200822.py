def bisearch(lst, x):
    l = 0
    r = len(lst) - 1
    while l < r:
        m = (l + r) // 2 + 1
        if lst[m] <= x:
            l = m
        else:
            r = m - 1
    return l


class Solution:
    def __init__(self, rects: List[List[int]]):
        def point_num(x1, y1, x2, y2):
            return (x2 - x1 + 1) * (y2 - y1 + 1)

        self.rects = rects
        self.n = len(rects)
        self.sizes = [0] * (self.n + 1)
        for i in range(1, self.n + 1):
            self.sizes[i] = self.sizes[i - 1] + point_num(*self.rects[i - 1])

    def pick(self) -> List[int]:
        ind = random.randint(0, self.sizes[-1] - 1)
        n = bisearch(self.sizes, ind)
        x1, y1, x2, _ = self.rects[n]
        exceed = ind - self.sizes[n]
        width = x2 - x1 + 1
        px = x1 + exceed % width
        py = y1 + exceed // width
        return [px, py]
