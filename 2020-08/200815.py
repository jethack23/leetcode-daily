def smallest_from_end(itvs):
    itvs = sorted(itvs, key=lambda x: (x[1], x[0]), reverse=True)
    i = 1
    cnt = 0
    last_end = itvs[0][1]
    while i < len(itvs):
        if itvs[i][1] == last_end:
            itvs.pop(i)
            cnt += 1
        else:
            last_end = itvs[i][1]
            i += 1
    return itvs, cnt  # no more same end point


def smallest_from_start(itvs):
    itvs = sorted(itvs)
    i = 1
    cnt = 0
    last_start = itvs[0][0]
    while i < len(itvs):
        if itvs[i][0] == last_start:
            itvs.pop(i)
            cnt += 1
        else:
            last_start = itvs[i][0]
            i += 1
    return itvs, cnt  # no more same start point, sorted


def remove_coverings(itvs):
    # input should be sorted
    i = 1
    cnt = 0
    while i < len(itvs):
        for j in range(i + 1, len(itvs)):
            if itvs[j][0] >= itvs[i][1]:
                break
            elif itvs[j][1] <= itvs[i][1]:
                itvs.pop(i)
                cnt += 1
                i -= 1
                break
        i += 1
    return itvs, cnt  # no more coverings


def split_into_nonoverlap(itvs):
    ret = []
    last = 0
    for i in range(1, len(itvs)):
        if itvs[i][0] >= itvs[i - 1][1]:
            ret.append(itvs[last:i])
            last = i
    ret.append(itvs[last : len(itvs)])
    return ret


def small_number(itvs):
    n = len(itvs)
    if n < 2:
        return 0
    elif n == 2:
        return 1
    cnt = 1
    cur = itvs[n - 1]
    for i in range(n - 2, -1, -1):
        if cur[0] >= itvs[i][1]:
            cnt += 1
            cur = itvs[i]
    return n - cnt


class Solution:
    def eraseOverlapIntervals(self, intervals):
        if len(intervals) < 2:
            return 0
        itvs, ret = smallest_from_end(intervals)
        itvs, cnt = smallest_from_start(itvs)
        ret += cnt
        itvs, cnt = remove_coverings(itvs)
        ret += cnt

        splitted = split_into_nonoverlap(itvs)
        for itvs in splitted:
            ret += small_number(itvs)
        return ret
