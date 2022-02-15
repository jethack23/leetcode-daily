class Solution:
    def longestStrChain(self, words: List[str]) -> int:
        words = set(words)
        mem = {}

        def recur(word):
            if not word in words:
                return 0
            sub = 0
            if word in mem:
                return mem[word]
            for i in range(len(word)):
                sub = max(sub, recur(word[:i] + word[i + 1 :]))
            mem[word] = 1 + sub
            return 1 + sub

        ret = 0
        for word in words:
            ret = max(ret, recur(word))

        return ret
