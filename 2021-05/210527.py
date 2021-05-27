from typing import List


class Solution:
    def maxProduct(self, words: List[str]) -> int:
        words.sort(reverse=True, key=len)
        ret = 0
        for w in words:
            n = len(w)
            if n * len(words[0]) < ret:
                break
            s = set(w)
            for v in words:
                m = len(v)
                if m * n < ret:
                    break
                if not s.intersection(set(v)):
                    ret = m * n
        return ret
