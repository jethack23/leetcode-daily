from itertools import chain
from typing import List


class Subseq:
    def __init__(self, s, l_closed, r_closed, pos, stamp):
        self.s = s
        self.stamp = stamp
        self.pos = pos
        self.l_closed = l_closed
        self.r_closed = r_closed

    def solve(self):
        if self.l_closed:
            ret, remain = self.solve_from_left()
        elif self.r_closed:
            ret, remain = self.solve_from_right()
        else:
            left, remain = self.solve_from_left()
            if remain:
                right, remain = Subseq(
                    remain, False, False, self.pos, self.stamp
                ).solve_from_right()
            else:
                right = []
            ret = right + left
        return None if remain else [x + self.pos for x in ret]

    def solve_from_left(self):
        ret = []
        j = len(self.s)
        l = len(self.stamp)
        while j > 0:
            l_limit = max(0, j - l) if self.l_closed else j - l
            for i in range(j - 1, l_limit - 1, -1):
                criterion = (
                    self.stamp.startswith(self.s[i:j])
                    if i >= 0
                    else self.stamp[-i:].startswith(self.s[:j])
                )
                if criterion:
                    ret.append(i)
                    j = i
                    break
            else:
                return ret[::-1], self.s[:j]
        return ret[::-1], None

    def solve_from_right(self):
        ret = []
        i = 0
        l = len(self.stamp)
        while i < len(self.s):
            r_limit = min(len(self.s), i + l) if self.r_closed else i + l
            for j in range(i + 1, r_limit + 1):
                criterion = (
                    self.stamp.endswith(self.s[i:j])
                    if j <= len(self.s)
                    else self.stamp[: len(self.s) - j].endswith(self.s[i:])
                )
                if criterion:
                    ret.append(j - l)
                    i = j
                    break
            else:
                return ret[::-1], self.s[i:]
        return ret[::-1], None

    def __len__(self):
        return len(self.s)

    def __repr__(self):
        return str([self.l_closed, self.s, self.r_closed])


class Solution:
    def movesToStamp(self, stamp: str, target: str) -> List[int]:
        subs, stamps = self.get_subs(stamp, target)
        if not stamps:
            return []
        ret = []
        for sub in subs:
            solve = sub.solve()
            if solve is None:
                return []
            else:
                ret += solve
        return ret + stamps

    def get_subs(self, stamp, target):
        l = len(stamp)
        n = len(target)
        subs = []
        stamps = []

        last = 0
        i = 0
        while i <= n - l:
            if target[i : i + l] == stamp:
                if i > 0:
                    subs.append(Subseq(target[last:i], last == 0, False, last, stamp))
                stamps.append(i)
                last = i + l
                i += l
            else:
                i += 1
        if last < n:
            subs.append(Subseq(target[last:], False, True, last, stamp))

        return subs, stamps

    def stampFromMoves(self, stamp, moves, target):
        temp = "0" * len(target)
        l = len(stamp)
        for i in moves:
            temp = temp[:i] + stamp + temp[i + l :]
        return temp, temp == target
