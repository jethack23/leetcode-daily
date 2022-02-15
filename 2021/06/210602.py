class Solution:
    def isInterleave(slef, a, b, t):
        n = len(a)
        m = len(b)
        if n + m != len(t):
            return False
        mem = [False] * (m + 1)
        mem[0] = True
        for j in range(m):
            if b[j] == t[j]:
                mem[j + 1] = True
            else:
                break
        for i in range(n):
            for j in range(m + 1):
                if t[i + j] == a[i] and mem[j]:
                    mem[j] = True
                else:
                    mem[j] = False
            for j in range(m):
                if mem[j] and t[i + 1 + j] == b[j]:
                    mem[j + 1] = True

        return mem[-1]
