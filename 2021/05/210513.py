def valid(f, s):
    if len(f) > 1 and f[0] == "0":
        return False
    elif len(s) > 0 and int(s) == 0:
        return False
    elif len(s) > 1 and s[-1] == "0":
        return False
    return True


def coord(f, s):
    if len(s) == 0:
        return f
    else:
        return f + "." + s


class Solution:
    def ambiguousCoordinates(self, s: str) -> List[str]:
        s = s[1:-1]
        ret = []
        for i in range(1, len(s)):
            first = s[:i]
            second = s[i:]
            for i in range(1, len(first) + 1):
                ff = first[:i]
                fs = first[i:]
                if not valid(ff, fs):
                    continue
                for j in range(1, len(second) + 1):
                    sf = second[:j]
                    ss = second[j:]
                    if not valid(sf, ss):
                        continue
                    ret.append("(" + coord(ff, fs) + ", " + coord(sf, ss) + ")")
        return ret
