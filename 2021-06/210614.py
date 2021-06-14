class Solution:
    def maximumUnits(self, b, t):
        b.sort(key=lambda x: x[1])
        ret = 0
        while t > 0 and b:
            ret += b[-1][1]
            t -= 1
            b[-1][0] -= 1
            if b[-1][0] == 0:
                b.pop()
        return ret
