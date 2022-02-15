def test(w, i):
    for j in range((len(w) - i) // 2):
        if w[i + j] != w[-j - 1]:
            return False
    return True


class Trie:
    def __init__(self):
        self.id = -1
        self.mem = [None] * 26
        self.hist = ""
        self.rest_palindrome = set()

    def add(self, w, id, d=0):
        self.hist = w[:d]
        if len(w) == d:
            self.id = id
            return
        if test(w, d):
            self.rest_palindrome.add(id)
        i = ord(w[d]) - ord("a")
        if self.mem[i]:
            self.mem[i].add(w, id, d + 1)
        else:
            self.mem[i] = Trie()
            self.mem[i].add(w, id, d + 1)


class Solution:
    def palindromePairs(self, words):
        ret = []
        r = Trie()
        for i, w in enumerate(words):
            r.add(w[::-1], i)
        for k, w in enumerate(words):
            if len(w) == 0:
                for j in r.rest_palindrome:
                    ret.append([j, k])
            cur = r
            for i, c in enumerate(w):
                idx = ord(c) - ord("a")
                if not cur.mem[idx]:
                    break
                cur = cur.mem[idx]
                if (j := cur.id) != -1 and j != k and test(w, i + 1):
                    ret.append([k, j])
            else:
                for j in cur.rest_palindrome:
                    if j != k:
                        ret.append([k, j])
        return ret
