class Solution:
    def wordPattern(self, pattern, s):
        return sol(pattern, s)


def sol(p, s):
    return check_pattern(list(p), s.split(), {}, set())


def check_pattern(p, s, inj, range_set):
    def recur(p, s):
        if not p:
            return True
        elif p[-1] in inj:
            return recur(p, s) if inj[p.pop()] == s.pop() else False
        elif s[-1] in range_set:
            return False
        else:
            mem_update(p.pop(), s.pop())
            return recur(p, s)

    def mem_update(pe, se):
        inj.update({pe: se})
        return range_set.add(se)

    return recur(p, s) if len(p) == len(s) else False
