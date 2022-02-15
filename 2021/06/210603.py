def max_gap(lst):
    ret = lst[0]
    for i in range(1, len(lst)):
        ret = max(ret, lst[i] - lst[i - 1])
    return ret


class Solution:
    def maxArea(self, h, w, hc, wc):
        wc.append(w)
        hc.append(h)
        x = max_gap(sorted(wc))
        y = max_gap(sorted(hc))
        return (x * y) % (10 ** 9 + 7)
