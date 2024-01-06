from bisect import bisect_left, bisect_right


def solution(ss, es, ps):
    jobs = sorted(zip(ss, es, ps), key=lambda x: [x[1], -x[0], -x[2]])
    ends = []
    profits = []
    for [s, e, p] in jobs:
        if not ends:
            ends.append(e)
            profits.append(p)
            continue
        track_pos = bisect_right(ends, s)
        save_pos = bisect_left(ends, e)
        new_profit = p + (0 if track_pos == 0 else profits[track_pos - 1])
        if save_pos == len(ends):
            if new_profit > profits[-1]:
                ends.append(e)
                profits.append(new_profit)
        elif ends[save_pos] == e:
            profits[save_pos] = max(profits[save_pos], new_profit)
        else:
            ends.insert(save_pos, e)
            profits.insert(save_pos, new_profit)
    return profits.pop()


class Solution:
    def jobScheduling(self, *args, **kwargs):
        return solution(*args, **kwargs)


list(
    map(
        lambda x: print(solution(*x)),
        [
            [[1, 2, 3, 3], [3, 4, 5, 6], [50, 10, 40, 70]],
            [[1, 2, 3, 4, 6], [3, 5, 10, 6, 9], [20, 20, 100, 70, 60]],
            [[1, 1, 1], [2, 3, 4], [5, 6, 4]],
        ],
    )
)
