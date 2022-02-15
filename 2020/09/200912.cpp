class Solution {
 public:
  void dfs(vector<int>& mem, int sum, int d, vector<vector<int>>& ret, int k,
           int n) {
    if (sum == n && mem.size() == k) ret.push_back(mem);
    if (d > 9 || sum >= n || mem.size() >= k) return;
    mem.push_back(d);
    dfs(mem, sum + d, d + 1, ret, k, n);
    mem.pop_back();
    dfs(mem, sum, d + 1, ret, k, n);
  }
  vector<vector<int>> combinationSum3(int k, int n) {
    vector<int> mem;
    vector<vector<int>> ret;
    dfs(mem, 0, 1, ret, k, n);
    return ret;
  }
};