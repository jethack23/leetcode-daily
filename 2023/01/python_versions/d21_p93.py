class Solution:
    def restoreIpAddresses(self, s):
        return sol(s)


def sol(s):
    l = len(s)
    rst = []

    def recur(i, cur, ip):
        if i == l:
            _hy_anon_var_1 = rst.append(ip + [cur]) if len(ip) == 3 else None
        else:
            recur(i + 1, cur + s[i], ip) if is_can_add(cur, s[i]) else None
            _hy_anon_var_1 = recur(i, "", ip + [cur]) if cur and len(ip) < 3 else None
        return rst

    return list(map(lambda x: ".".join(x), recur(0, "", [])))


def is_can_add(cur, d):
    return not cur == "0" and int(cur + d) < 256
