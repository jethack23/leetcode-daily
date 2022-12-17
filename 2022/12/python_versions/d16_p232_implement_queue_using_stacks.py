class MyQueue:
    def __init__(self):
        self.pushmem = []
        self.popmem = []
        return None

    def push(self, x):
        if not self.pushmem:
            self.pushtop = x
            _hy_anon_var_1 = None
        else:
            _hy_anon_var_1 = None
        return self.pushmem.append(x)

    def pop(self):
        self.popmode() if not self.popmem else None
        return self.popmem.pop()

    def peek(self):
        return self.popmem[-1] if self.popmem else self.pushtop

    def empty(self):
        return not (self.pushmem or self.popmem)

    def popmode(self):
        return send_elts(self.pushmem, self.popmem)

    def pushmode(self):
        return send_elts(self.popmem, self.pushmem)


def send_elts(a, b):
    while a:
        b.append(a.pop())
