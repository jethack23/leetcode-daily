class Solution:
    def canCompleteCircuit(self, gas, cost):
        return sol(gas, cost)


def sol(gs, cs):
    history = travel_log(gs, cs)
    return -1 if history[-1] < 0 else min_position(history)


def travel_log(gs, cs):
    cur = gs.pop() - cs.pop()
    rst = [cur]
    for [g, c] in zip(gs, cs):
        cur += g
        cur -= c
        rst.append(cur)
    return rst


def min_position(history):
    return min(range(len(history)), key=lambda i: history[i])
