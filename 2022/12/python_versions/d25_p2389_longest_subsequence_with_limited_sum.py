class Solution:
    def answerQueries(self, nums, queries):
        return sol(nums, queries)


def sol(nums, queries):
    psum = sort_and_prefix_sum(nums)
    rst = []
    for q in queries:
        rst.append(bisect_right(psum, q) - 1)
    return rst


def sort_and_prefix_sum(nums):
    rst = [0]
    for n in sorted(nums):
        rst.append(rst[-1] + n)
    return rst


sol([2, 3, 4, 5], [1])
sol([4, 5, 2, 1], [3, 10, 21])
