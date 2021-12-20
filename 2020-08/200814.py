class Solution:
    def longestPalindrome(self, s: str) -> int:
        ret = 0
        dropped = False
        mem = defaultdict(int)
        for c in s:
            mem[c] += 1
        for c in mem:
            if mem[c] % 2:
                ret += mem[c] - 1
                dropped = True
            else:
                ret += mem[c]
        return ret + dropped
