import heapq


class Solution:
    def maxPerformance(self, n, s, e, k):
        engineers = sorted(zip(s, e), reverse=True, key=lambda x: x[1])
        heap = []
        ret = 0
        # sum of speeds
        ss = 0 
        for s, e in engineers:
            if len(heap) >= k:
                ss -= heapq.heappop(heap)
            heapq.heappush(heap, s)
            ss += s
            ret = max(ret, ss * e)
        return ret % 1000000007