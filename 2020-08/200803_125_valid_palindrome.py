class Solution:
    def isPalindrome(self, s: str) -> bool:
        s = s.lower()
        m = ""
        for c in s:
            if (ord(c) <= ord("z") and ord(c) >= ord("a")) or (
                ord(c) <= ord("9") and ord(c) >= ord("0")
            ):
                m += c
        return m == m[::-1]
