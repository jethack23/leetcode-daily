class CombinationIterator:
    def __init__(self, characters: str, combinationLength: int):
        self.characters = characters
        self.n = n = combinationLength
        self.l = l = len(characters)
        self.cursors = [self.l - 1] * n
        self.cursors[0] = -1
        self.occupied = [0] * l

    def next(self) -> str:
        for i in range(self.n - 1, -1, -1):
            if self.movable(i):
                self.move(i)
                return self.answer()

    def hasNext(self) -> bool:
        for i in range(self.n):
            if self.movable(i):
                return True
        return False

    def answer(self):
        return "".join([self.characters[c] for c in self.cursors])

    def movable(self, i):
        for j in range(self.cursors[i] + 1, self.l):
            if not self.occupied[j]:
                return True
        return False

    def move(self, i):
        # make it vacancy
        for j in range(i, self.n):
            self.occupied[self.cursors[j]] = 0
        self.fill(i, self.cursors[i] + 1)
        for j in range(i + 1, self.n):
            self.fill(j, self.cursors[i])

    def fill(self, i, pos):
        while self.occupied[pos]:
            pos += 1
        self.occupied[pos] = i + 1
        self.cursors[i] = pos


# Your CombinationIterator object will be instantiated and called as such:
# obj = CombinationIterator(characters, combinationLength)
# param_1 = obj.next()
# param_2 = obj.hasNext()
