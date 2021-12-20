class Solution:
    def repeatedSubstringPattern(self, s: str) -> bool:
        i = 1
        while i <= len(s) / 2:
            if len(s) % i:
                i += 1
                continue
            if s == s[:i] * (len(s) // i): return True
            i += 1
        return False
