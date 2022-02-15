class Solution:
    def exist(self, board: List[List[str]], word: str) -> bool:
        # make memory
        self.board = board
        self.height = len(board)
        self.width = len(board[0])
        self.found = False
        self.word = word

        # set trail memory
        self.trail = []
        for _ in range(self.height):
            self.trail.append([0] * self.width)

        # brute force search
        for j in range(self.height):
            for i in range(self.width):
                self.find_word(i, j)
                if self.found:
                    return True
        return False

    def find_word(self, i, j):
        self.recur_search(i, j, self.word[:])

    def recur_search(self, i, j, word):
        # quit when index out of range
        if i >= self.width or j >= self.height or i < 0 or j < 0:
            return
        # quit when already visited in this search
        if self.trail[j][i]:
            return
        # quit when already found or first letter not match
        if self.found or self.board[j][i] != word[0]:
            return
        # successful quit when last letter found
        if len(word) == 1:
            self.found = True
            return

        self.trail[j][i] = 1

        # north
        self.recur_search(i, j + 1, word[1:])
        # east
        self.recur_search(i + 1, j, word[1:])
        # west
        self.recur_search(i - 1, j, word[1:])
        # south
        self.recur_search(i, j - 1, word[1:])

        self.trail[j][i] = 0
