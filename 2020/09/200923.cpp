class Solution {
 public:
  int canCompleteCircuit(vector<int>& gas, vector<int>& cost) {
    int n = gas.size();
    int tank = 0;
    int total_lack = 0;
    int start = 0;
    for (int i = 0; i < n; i++) {
      tank += gas[i] - cost[i];
      if (tank < 0) {
        total_lack += tank;
        start = i + 1;
        tank = 0;
      }
    }
    return (tank + total_lack >= 0) ? start : -1;
  }
};