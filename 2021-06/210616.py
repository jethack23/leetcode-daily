class Solution:
    def generateParenthesis(self, n):
        mem = [("", 0, 0)]

        def recur(d, mem):
            if d == 0:
                return mem
            temp = []
            for s, l, r in mem:
                if l < n:
                    temp.append((s + "(", l + 1, r))
                if l > r:
                    temp.append((s + ")", l, r + 1))
            mem = temp
            return recur(d - 1, temp)

        return [x[0] for x in recur(2 * n, mem)]
