class Solution:
    def convert(self, s, row):
        return sol(s, row)


def sol(s, row):
    return s if row < 2 else "".join(reduce(lambda x, y: x + y, get_rows(s, row)))


def get_rows(s, row):
    o = row - 1
    rows = [[] for _ in range(row)]
    for [i, c] in enumerate(s):
        rows[o - abs(o - i % (2 * o))].append(c)
    return rows
