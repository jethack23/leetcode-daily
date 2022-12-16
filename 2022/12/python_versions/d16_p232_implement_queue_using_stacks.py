class MyQueue:
    def __init__(self):
        self.pushmem = []
        self.popmem = []
        return None

    def push(self, x):
        self.pushmode()
        return self.pushmem.append(x)

    def pop(self):
        self.popmode()
        return self.popmem.pop()

    def peek(self):
        self.popmode()
        return self.popmem[-1]

    def empty(self):
        return not (self.pushmem or self.popmem)

    def popmode(self):
        return send_elts(self.pushmem, self.popmem)

    def pushmode(self):
        return send_elts(self.popmem, self.pushmem)


def send_elts(a, b):
    while a:
        b.append(a.pop())
