class Solution:
    def isSameTree(self, p, q):
        return sol(p, q)


def sol(p, q):
    def recur(p, q):
        return (
            p is q
            if p is None or q is None
            else p.val == q.val and recur(p.left, q.left) and recur(p.right, q.right)
        )

    return recur(p, q)
