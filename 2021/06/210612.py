from heapq import heappush, heappop


class Solution:
    def minRefuelStops(self, t, f, s):
        n = len(s)
        mem = []
        s.append([t, 0])
        ret = 0
        for i in range(n + 1):
            while f < s[i][0]:
                if not mem:
                    return -1
                f -= heappop(mem)
                ret += 1
            heappush(mem, -s[i][1])
        return ret
