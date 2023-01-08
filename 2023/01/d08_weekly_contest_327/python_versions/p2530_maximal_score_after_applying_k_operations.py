class Solution:
    def maxKelements(self, nums, k):
        return sol(nums, k)


def sol(ps, k):
    ps = maxheap(ps)
    rst = 0
    for _ in range(k):
        rst += optimal_operation(ps)
    return rst


def maxheap(l):
    rst = [-x for x in l]
    heapify(rst)
    return rst


def maxheappop(h):
    return -heappop(h)


def maxheappush(h, x):
    return heappush(h, -x)


def optimal_operation(h):
    n = maxheappop(h)
    maxheappush(h, remain(n))
    return n


def remain(x):
    return x // 3 + (1 if x % 3 else 0)
