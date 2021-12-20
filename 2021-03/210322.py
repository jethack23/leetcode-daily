import re


class Solution:
    vovels = re.compile("[aeiou]")

    def spellchecker(self, wordlist: List[str], queries: List[str]) -> List[str]:
        exact, low, vowel = set(wordlist), {}, {}
        for i, w in enumerate(wordlist):
            lw = w.lower()
            vw = self.vovels.sub("_", lw)
            if lw not in low:
                low[lw] = w
            if vw not in vowel:
                vowel[vw] = w

        res = []
        for q in queries:
            if q in exact:
                res.append(q)
                continue
            q = q.lower()
            if q in low:
                res.append(low[q])
                continue
            q = self.vovels.sub("_", q)
            res.append(vowel.get(q, ""))
        return res
