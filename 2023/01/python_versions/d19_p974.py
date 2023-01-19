class Solution:
    def subarraysDivByK(self, nums, k):
        return sol(nums, k)


def sol(nums, k):
    psum = get_psum(nums)
    cnt = Counter(map(lambda x: x % k, psum))
    return sum(map(lambda x: x * (x - 1) // 2, cnt.values()))


def get_psum(nums):
    rst = [0]
    cur = 0
    for n in nums:
        cur += n
        rst.append(cur)
    return rst
