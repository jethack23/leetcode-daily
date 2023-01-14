class Solution:
    def smallestEquivalentString(self, s1, s2, baseStr):
        return sol(s1, s2, baseStr)


def sol(a, b, s):
    parents = propagate_root(get_parents(a, b))
    return "".join(map(idx_to_alphabet, [parents[i] for i in map(alphabet_to_idx, s)]))


def alphabet_to_idx(x):
    return ord(x) - ord("a")


def idx_to_alphabet(x):
    return chr(ord("a") + x)


def get_root(x, parent):
    while x != parent[x]:
        x = parent[x]
    return x


def get_parents(a, b):
    rst = list(range(26))
    for [c, d] in zip(map(alphabet_to_idx, a), map(alphabet_to_idx, b)):
        cr = get_root(c, rst)
        dr = get_root(d, rst)
        if dr < cr:
            [cr, dr] = [dr, cr]
            _hy_anon_var_1 = None
        else:
            _hy_anon_var_1 = None
        rst[dr] = cr
    return rst


def propagate_root(parents):
    for [i, p] in enumerate(parents):
        parents[i] = parents[p]
    return parents
