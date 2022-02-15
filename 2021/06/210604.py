from collections import deque


def step(cur, pos, size):
    temp = [x for x in cur]
    temp[pos] = str((int(temp[pos]) + size) % 10)
    return "".join(temp)


class Solution:
    def openLock(self, d, t):
        visited = set()
        d = set(d)
        q = deque([])
        q.append(("0000", 0))
        visited.add("0000")
        while q:
            top, depth = q.popleft()
            if top == t:
                return depth
            if top in d:
                continue
            for pos in range(4):
                for size in [-1, 1]:
                    new = step(top, pos, size)
                    if new in visited:
                        continue
                    visited.add(new)
                    q.append((new, depth + 1))
        return -1
