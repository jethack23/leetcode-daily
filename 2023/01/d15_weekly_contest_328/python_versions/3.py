class Solution:
    def countGood(self, nums: List[int], k: int) -> int:
        return sol(nums, k)


def sol(nums, k):
    cnt = Counter()
    q = deque()
    npair = 0
    rst = 0
    l = len(nums)
    for [i, n] in enumerate(nums):
        q.append(n)
        npair += cnt[n]
        cnt[n] += 1
        while npair >= k:
            rst += l - i
            popped = q.popleft()
            cnt[popped] -= 1
            npair -= cnt[popped]
    return rst


None
