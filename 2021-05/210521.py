def update(perm, i, j):
    for c in perm:
        if perm[c] == i:
            perm[c] = j
        elif perm[c] == j:
            perm[c] = i
    return perm


class Solution:
    def findAndReplacePattern(self, words: List[str], pattern: str) -> List[str]:
        ret = []
        for word in words:
            print(word)
            perm = {c: c for c in "qwertyuiopasdfghjklzxcvbnm"}
            changed = set()
            for i, j in zip(pattern, word):
                if perm[i] != j:
                    if i in changed:
                        break
                    else:
                        perm = update(perm, perm[i], j)
            else:
                for i, j in zip(pattern, word):
                    print(i, perm[i], j)
                    if perm[i] != j:
                        break
                else:
                    ret.append(word)
        return ret
