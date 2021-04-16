class MyCircularQueue:

    def __init__(self, k: int):
        self.mem = [-1] * k
        self.k = k
        self.f = 0
        self.e = -1

    def enQueue(self, value: int) -> bool:
        if not self.isFull():
            self.e = (self.e + 1) % self.k
            self.mem[self.e] = value
            return True
        else:
            return False

    def deQueue(self) -> bool:
        if not self.isEmpty():
            self.mem[self.f] = -1
            self.f = (self.f + 1) % self.k
            return True
        else:
            return False


    def Front(self) -> int:
        return self.mem[self.f]

    def Rear(self) -> int:
        return self.mem[self.e]

    def isEmpty(self) -> bool:
        return self.mem[self.f] == -1

    def isFull(self) -> bool:
        return self.mem[(self.e + 1) % self.k] != -1
