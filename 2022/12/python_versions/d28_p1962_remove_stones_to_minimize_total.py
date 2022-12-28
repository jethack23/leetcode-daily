class Solution:
    def minStoneSum(self, ps, k):
        return sol(ps, k)


def sol(ps, k):
    ps = maxheap(ps)
    for _ in range(k):
        optimal_operation(ps)
    return -sum(ps)


def maxheap(l):
    rst = [-x for x in l]
    heapify(rst)
    return rst


def maxheappop(h):
    return -heappop(h)


def maxheappush(h, x):
    return heappush(h, -x)


def optimal_operation(h):
    return maxheappush(h, remain(maxheappop(h)))


def remain(x):
    return x // 2 + x % 2
