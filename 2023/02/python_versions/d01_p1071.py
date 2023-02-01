class Solution:
    def gcdOfStrings(self, str1, str2):
        return sol(str1, str2)


def sol(s1, s2):
    l1 = len(s1)
    l2 = len(s2)
    a = max(l1, l2)
    b = min(l1, l2)
    while b != 0:
        [a, b] = [b, a % b]
    f1 = s1[slice(None, a)]
    f2 = s2[slice(None, a)]
    return f1 if f1 == f2 and s1 == f1 * (l1 // a) and (s2 == f2 * (l2 // a)) else ""
