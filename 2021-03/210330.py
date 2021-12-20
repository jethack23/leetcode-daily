from typing import List


class Solution:
    def maxEnvelopes(self, envelopes: List[List[int]]) -> int:
        envelopes.sort(key=lambda x: (x[0], -x[1]))

        mem = []
        for _, h in envelopes:
            pos = bisect_left(mem, h)
            if pos == len(mem):
                mem.append(h)
            else:
                mem[pos] = h
        return len(mem)
