class WordFilter:
    def __init__(self, words: List[str]):
        self.dict = {}
        for i, w in enumerate(words):
            for j in range(1, len(w) + 1):
                for k in range(1, len(w) + 1):
                    self.dict[w[:j] + "{" + w[-k:]] = i

    def f(self, prefix: str, suffix: str) -> int:
        return self.dict[prefix + "{" + suffix]


# Your WordFilter object will be instantiated and called as such:
# obj = WordFilter(words)
# param_1 = obj.f(prefix,suffix)
