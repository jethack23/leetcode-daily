class Solution:
    def canCompleteCircuit(self, gas, cost):
        return sol(gas, cost)


def sol(gs, cs):
    current_gas = 0
    historical_min = 0
    min_position = 0
    for [i, [g, c]] in enumerate(zip(gs, cs)):
        current_gas += g - c
        min_position = i + 1 if current_gas < historical_min else min_position
        historical_min = min(current_gas, historical_min)
    return -1 if current_gas < 0 else min_position
