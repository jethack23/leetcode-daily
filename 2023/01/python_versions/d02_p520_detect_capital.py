class Solution:
    def detectCapitalUse(self, w):
        ns = [1 if c.isupper() else 0 for c in w]
        ss = sum(ns)
        return ss == 1 or ss == len(ns) if ns[0] else ss == 0
