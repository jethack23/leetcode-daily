class Solution:
    def wordPattern(self, pattern, s):
        return sol(pattern, s)


def sol(p, s):
    return check_pattern(list(p), s.split(), {}, {})


def check_pattern(p, s, inj, surj):
    if not p or not s:
        return not p and (not s)
    elif p[-1] in inj or s[-1] in surj:
        return (
            check_pattern(p, s, inj, surj)
            if bijection_check(p.pop(), s.pop(), inj, surj)
            else False
        )
    else:
        mem_update(p.pop(), s.pop(), inj, surj)
        return check_pattern(p, s, inj, surj)


def bijection_check(pe, se, inj, surj):
    return pe in inj and inj[pe] == se and (se in surj) and (surj[se] == pe)


def mem_update(pe, se, inj, surj):
    inj.update({pe: se})
    return surj.update({se: pe})
