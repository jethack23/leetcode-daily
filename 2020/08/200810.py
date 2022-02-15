class Solution:
    def titleToNumber(self, s: str) -> int:
        d = {}
        S = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        ret = 0

        for i in range(26):
            d[S[i]] = i + 1

        cm = 1
        for c in s[::-1]:
            ret += d[c] * cm
            cm *= 26

        return ret
