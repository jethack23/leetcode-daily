class Solution:
    def numTilings(self, n):
        return sol(n) % 1000000007


def sol(n):
    domem = deque([1, 1])
    trimem = deque([0, 0])
    for i in range(1, n):
        [dn, tn] = [domem[-1] + domem[-2] + trimem[-1], 2 * domem[-2] + trimem[-1]]
        domem.append(dn)
        trimem.append(tn)
        domem.popleft()
        trimem.popleft()
    return domem.pop()
