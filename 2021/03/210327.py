class Solution:
    def countSubstrings(self, s):
        def cnt_odd_pal(s, i):
            cnt = 0
            for j in range(min(len(s) - i, i + 1)):
                if s[i - j] == s[i + j]:
                    cnt += 1
                    _hy_anon_var_29 = None
                else:
                    break
                    _hy_anon_var_29 = None
            return cnt

        def cnt_even_pal(s, i):
            cnt = 0
            for j in range(min(len(s) - i, i)):
                if s[i - j - 1] == s[i + j]:
                    cnt += 1
                    _hy_anon_var_31 = None
                else:
                    break
                    _hy_anon_var_31 = None
            return cnt

        l = len(s)
        cnt = 0
        for i in range(l):
            cnt += cnt_odd_pal(s, i)
            cnt += cnt_even_pal(s, i)
        return cnt

