class Solution:
    def makesquare(self, m):
        def dfs(d, l):
            if d == len(m):
                return True
            e = m[d]
            for i in range(4):
                if l[i] + e > s:
                    continue
                l[i] += e
                if dfs(d + 1, l):
                    return True
                l[i] -= e
            return False

        m.sort(reverse=True)
        S = sum(m)
        s = S // 4
        if S % 4 != 0 or m[0] > s:
            return False

        mem = [0] * 4
        mem[0] = m[0]
        return dfs(1, mem)
