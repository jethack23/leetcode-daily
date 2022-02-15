from typing import List


class Tree:
    def __init__(self):
        self.children = [None] * 26
        self.has_child = False

    def add(self, word):
        if word:
            char = word[-1]
            new_word = word[:-1]
            char_ind = ord(char) - ord("a")
            if self.children[char_ind] is None:
                self.children[char_ind] = Tree()
                self.has_child = True
            self.children[char_ind].add(new_word)


class Solution:
    def minimumLengthEncoding(self, words: List[str]) -> int:
        root = Tree()

        for word in words:
            root.add(word)

        def dfs(root, depth=0):
            if not root.has_child:
                return depth + 1

            cnt = 0

            for node in root.children:
                if node:
                    cnt += dfs(node, depth + 1)

            return cnt

        return dfs(root)

