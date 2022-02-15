class Solution:
    def toLowerCase(self, s: str) -> str:
        ret = []
        for c in s:
            if ord("A") <= ord(c) <= ord("Z"):
                ret.append(chr(ord(c) - ord("A") + ord("a")))
            else:
                ret.append(c)
        return "".join(ret)

