class Solution:
    def canJump(self, nums):
        return sol(nums)


def sol(nums):
    target = len(nums) - 1

    def recur(q, atmost=0, i=0):
        return (
            False
            if i > atmost
            else True
            if atmost >= target
            else recur(q, max(atmost, i + q.popleft()), i + 1)
            if True
            else None
        )

    return recur(deque(q))
