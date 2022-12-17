from collections import deque


class Solution:
    def evalRPN(self, rpn):
        return sol(rpn)


def sol(rpn):
    def recur(q, mem):
        return recur(q, process_token(q.popleft(), mem)) if q else mem.pop()

    return recur(deque(rpn), [])


def process_token(t, mem):
    proc_op(lambda y, x: x + y, mem) if t == "+" else proc_op(
        lambda y, x: x - y, mem
    ) if t == "-" else proc_op(div, mem) if t == "/" else proc_op(
        lambda y, x: x * y, mem
    ) if t == "*" else mem.append(
        int(t)
    ) if True else None
    return mem


def div(y, x):
    return sgn(x) * sgn(y) * (abs(x) // abs(y))


def sgn(x):
    return -1 if x < 0 else 1


def proc_op(f, mem):
    return mem.append(f(mem.pop(), mem.pop()))
