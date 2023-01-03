class Solution:
    def minDeletionSize(self, strs):
        return sols(strs)


def sol(strs):
    rst = 0
    for col in zip(*strs):
        if is_has_invert(col):
            rst += 1
            _hy_anon_var_1 = None
        else:
            _hy_anon_var_1 = None
    return rst


def is_has_invert(col):
    for i in range(len(col) - 1):
        if is_inverted(col, i):
            return True
            _hy_anon_var_2 = None
        else:
            _hy_anon_var_2 = None
    return False


def is_inverted(col, i):
    return col[i] > col[i + 1]
