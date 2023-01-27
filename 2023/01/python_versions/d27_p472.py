class Solution:
    def findAllConcatenatedWordsInADict(self, words: List[str]) -> List[str]:
        return sol(words)


def alpha2idx(a):
    return ord(a) - ord("a")


class Trie:
    def __init__(self):
        self.childs = [False] * 26
        self.eow = False

    def add(self, w, i=0):
        if i == len(w):
            self.eow = True
            _hy_anon_var_4 = None
        else:
            if not self.childs[alpha2idx(w[i])]:
                self.childs[alpha2idx(w[i])] = Trie()
                _hy_anon_var_3 = None
            else:
                _hy_anon_var_3 = None
            _hy_anon_var_4 = self.childs[alpha2idx(w[i])].add(w, i + 1)
        return _hy_anon_var_4


def sol(words):
    t = Trie()
    for w in words:
        t.add(w)

    def recur(s, i=0, node=t, found=0):
        return (
            found > 0 and node.eow
            if i == len(s)
            else node.eow
            and recur(s, i, t, found + 1)
            or (
                node.childs[alpha2idx(s[i])]
                and recur(s, i + 1, node.childs[alpha2idx(s[i])], found)
            )
        )

    return list(filter(lambda x: recur(x), words))


None
