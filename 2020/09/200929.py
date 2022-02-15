from typing import List


class Trie:
    def __init__(self, words, root=None):
        self.root = root
        self.children = {}
        for w in words:
            self.add(w)

    def add(self, w):
        if len(w) == 0:
            self.children["eow"] = None
        elif w[0] in self.children:
            self.children[w[0]].add(w[1:])
        else:
            root = self if self.root is None else self.root
            self.children[w[0]] = Trie([w[1:]], root)

    def search(self, s, mem=None):
        if mem is None: mem={}
        if self.root is None and len(s) in mem:
            return mem[len(s)]
        if len(s) == 0:
            return self.root is None or "eow" in self.children
        ret = False
        for k, v in self.children.items():
            if k == "eow":
                if self.root.search(s, mem):
                    ret = True
            elif k == s[0]:
                if v.search(s[1:], mem):
                    ret = True
        if self.root is None:
            mem[len(s)] = ret
        return ret


class Solution:
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        t = Trie(wordDict)
        return t.search(s)