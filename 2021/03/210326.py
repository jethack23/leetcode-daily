from typing import List


class Solution:
    def wordSubsets(self, A: List[str], B: List[str]) -> List[str]:
        mem = [0] * 26

        for b in B:
            cnt = [0] * 26
            for c in b:
                cnt[ord(c) - ord("a")] += 1
            for i in range(26):
                mem[i] = max(mem[i], cnt[i])

        res = []
        for a in A:
            cnt = [0] * 26
            for c in a:
                cnt[ord(c) - ord("a")] += 1
            universal = True
            for i in range(26):
                if mem[i] > cnt[i]:
                    universal = False
                    break
            if universal:
                res.append(a)

        return res
