class Solution:
    def dailyTemperatures(self, ts):
        return sol(ts)


def sol(ts):
    return loop_and_save(ts, [0] * len(ts))


def loop_and_save(ts, mem):
    stack = []
    for [i, t] in enumerate(ts):
        while stack and t > stack[-1][0]:
            j = stack.pop()[1]
            mem[j] = i - j
        stack.append([t, i])
    return mem
