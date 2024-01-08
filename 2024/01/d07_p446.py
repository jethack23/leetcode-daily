def solution(nums):
    lnums = len(nums)
    if len(set(nums)) == 1:
        return 2**lnums - 1 - lnums - lnums * (lnums - 1) // 2
    duos = []
    sss = []
    for [i, n] in enumerate(nums):
        news = []
        for [t, d, l] in sss:
            if t == n:
                news.append([n + d, d, l + 1])
        for [d, t] in duos:
            if t == n:
                news.append([n + d, d, 3])
        sss += news
        for k in nums[:i]:
            duos.append([(d := (n - k)), n + d])
    return len(sss)


class Solution:
    def numberOfArithmeticSlices(self, *args, **kwargs):
        return solution(*args, **kwargs)


list(map(lambda x: print(solution(*x)), [[[2, 4, 6, 8, 10]], [[7, 7, 7, 7, 7]]]))
