class Solution:
    def partition(self, s):
        return sol(s)


def sol(s):
    rst = []
    l = len(s)

    def recur(i, cur, lst):
        if i == l:
            _hy_anon_var_1 = rst.append(lst + [cur]) if is_palindrome(cur) else None
        else:
            recur(i + 1, cur + s[i], lst)
            _hy_anon_var_1 = (
                recur(i + 1, s[i], lst + [cur]) if is_palindrome(cur) else None
            )
        return rst

    return recur(0, "", [])


def is_palindrome(s):
    l = len(s)
    return s and reduce(
        lambda x, y: x and y, [s[i] == s[l - 1 - i] for i in range(l // 2)], True
    )
