class Solution {
 public:
  int mincostTickets(vector<int>& days, vector<int>& costs) {
    vector<int> mem(366, 0);
    for (auto d : days) mem[d - 1] = -1;
    for (int i = 364; i >= 0; i--) {
      if (mem[i] == -1) {
        int cur_cost = costs[0] + mem[i + 1];
        if (i + 7 < 366 && costs[1] + mem[i + 7] < cur_cost) {
          cur_cost = costs[1] + mem[i + 7];
        }
        if (i + 30 < 366 && costs[2] + mem[i + 30] < cur_cost) {
          cur_cost = costs[2] + mem[i + 30];
        }
        mem[i] = cur_cost;
      } else
        mem[i] = mem[i + 1];
    }
    return mem[0];
  }
};
