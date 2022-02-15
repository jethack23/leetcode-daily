from typing import List


class Solution:
    def evalRPN(self, tokens: List[str]) -> int:
        mem = []
        op = {
            "+": lambda a, b: a + b,
            "-": lambda a, b: a - b,
            "*": lambda a, b: a * b,
            "/": lambda a, b: a // b + 1 if a * b < 0 and a % b != 0 else a // b,
        }
        for t in tokens:
            if t in op:
                b = mem.pop()
                a = mem.pop()
                mem.append(op[t](a, b))
            else:
                mem.append(int(t))
        return mem[-1]
