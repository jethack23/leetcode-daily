class Solution:
    def canCompleteCircuit(self, gas, cost):
        return sol(gas, cost)


def sol(gs, cs):
    current_gas = 0
    historical_min = 0
    min_position = 0
    for [i, [g, c]] in enumerate(zip(gs, cs)):
        current_gas += g - c
        if current_gas < historical_min:
            min_position = i + 1
            historical_min = current_gas
            _hy_anon_var_1 = None
        else:
            _hy_anon_var_1 = None
    return -1 if current_gas < 0 else min_position
