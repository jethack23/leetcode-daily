class SummaryRanges:
    def __init__(self):
        self.mem = []
        return None

    def addNum(self, value):
        return self.mem.insert(bisect_left(self.mem, [value, value]), [value, value])

    def getIntervals(self):
        rst = []
        for itv in self.mem:
            if rst and itv[0] <= rst[-1][-1] + 1:
                rst[-1][-1] = max(itv[-1], rst[-1][-1])
                _hy_anon_var_1 = None
            else:
                _hy_anon_var_1 = rst.append(itv)
        self.mem = rst
        return self.mem


S = SummaryRanges()
S.addNum(1)
S.getIntervals()
S.addNum(2)
S.getIntervals()
