class Node:
    def __init__(self, val=""):
        self.val = val
        self.eow = False
        self.childs = {}

    def add(self, s):
        if len(s) == 0:
            self.eow = True
            return
        c = s[0]
        if c not in self.childs:
            self.childs[c] = Node(self.val + c)
        self.childs[c].add(s[1:])


class Solution:
    def wordBreak(self, s, wordDict):
        def search(s, node, ret=[]):
            if node.eow:
                ret.append(node.val)
            if len(s) == 0:
                return ret
            c = s[0]
            if c not in node.childs:
                return ret
            else:
                return search(s[1:], node.childs[c], ret)

        head = Node()
        mem = [[] for _ in range(len(s) + 1)]
        ml = 0
        for w in wordDict:
            head.add(w)
            ml = max(len(w), ml)
        for i in range(len(s)):
            searched = search(s[i:], head, [])
            if searched:
                cnt = 0
                for w in searched:
                    mem[i + len(w)].append(w)
        # feasibility check
        for i in range(1, len(mem)):
            if not mem[i]:
                reached = False
                for j in range(i + 1, min(i + ml, len(mem))):
                    ll = 0
                    for w in mem[j]:
                        ll = max(ll, len(w))
                    if ll > j - i:
                        reached = True
                        break
                if not reached:
                    return []
        for i in range(len(mem)):
            if mem[i]:
                sentences = []
                for w in mem[i]:
                    if len(w) == i:
                        sentences = [[w]]
                    for sentence in mem[i - len(w)]:
                        sentences.append(sentence + [w])
                mem[i] = sentences
        return [" ".join(sentence) for sentence in mem[-1]]
