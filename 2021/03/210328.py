class Solution:
    def originalDigits(self, s):
        def sub(mem, s):
            for c in s:
                mem[ord(c) - ord("a")] -= 1
            return mem

        def getidx(c):
            return ord(c) - ord("a")

        def catch(mem, digits, c, d, s):
            while mem[getidx(c)] > 0:
                digits[d] += 1
                mem = sub(mem, s)
            return [mem, digits]

        mem = [0] * 26
        for c in s:
            mem[ord(c) - ord("a")] += 1
        digits = [0] * 10
        criteria = [
            ["z", 0, "zero"],
            ["w", 2, "two"],
            ["x", 6, "six"],
            ["u", 4, "four"],
            ["f", 5, "five"],
            ["v", 7, "seven"],
            ["o", 1, "one"],
            ["g", 8, "eight"],
            ["h", 3, "three"],
            ["n", 9, "nine"],
        ]
        for [c, d, s] in criteria:
            [mem, digits] = catch(mem, digits, c, d, s)
        res = ""
        for i in range(10):
            if digits[i]:
                res += str(i) * digits[i]
                _hy_anon_var_24 = None
            else:
                _hy_anon_var_24 = None
        return res
