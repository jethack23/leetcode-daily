class Node:
    def __init__(self, val=None, eow=False):
        self.val = val
        self.eow = eow
        self.childs = {}

    def add(self, s):
        if len(s) == 0:
            self.eow = True
            return
        elif s[0] not in self.childs.keys():
            self.childs[s[0]] = Node(s[0])
        self.childs[s[0]].add(s[1:])

    def search(self, s):
        if len(s) == 0:

            return self.eow
        elif s[0] == ".":
            ret = False
            for k in self.childs.keys():
                ret = ret or self.childs[k].search(s[1:])
            return ret
        elif s[0] in self.childs.keys():

            return self.childs[s[0]].search(s[1:])
        return False


class WordDictionary:
    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.head = Node()

    def addWord(self, word: str) -> None:
        """
        Adds a word into the data structure.
        """
        self.head.add(word)
        return

    def search(self, word: str) -> bool:
        """
        Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter.
        """
        return self.head.search(word)


# Your WordDictionary object will be instantiated and called as such:
# obj = WordDictionary()
# obj.addWord(word)
# param_2 = obj.search(word)
