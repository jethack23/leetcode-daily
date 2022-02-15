class Solution:
    def hasAllCodes(self, s: str, k: int) -> bool:
        def bstr2int(bstr):
            ret = 0
            mul = 1
            for c in bstr[::-1]:
                ret += int(c) * mul
                mul *= 2
            return ret

        if k > 18:
            return False

        cnt = 2 ** k

        if len(s) - k + 1 < cnt:
            return False

        mem = set()

        for i in range(len(s) - k + 1):
            cut = s[i : i + k]
            if not cut in mem:
                mem.add(cut)
                cnt -= 1
                if cnt == 0:
                    return True

        return False
