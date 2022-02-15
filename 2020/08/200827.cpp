class Solution {
 public:
  vector<int> findRightInterval(vector<vector<int>> &intervals) {
    int n = intervals.size();
    vector<int> lidxs, ridxs;
    for (int i = 0; i < n; i++) {
      lidxs.push_back(i);
      ridxs.push_back(i);
    };
    auto lcmp = [&](auto &x, auto &y) {
      return intervals[x][0] < intervals[y][0];
    };
    auto rcmp = [&](auto &x, auto &y) {
      return intervals[x][1] < intervals[y][1];
    };
    sort(lidxs.begin(), lidxs.end(), lcmp);
    sort(ridxs.begin(), ridxs.end(), rcmp);
    vector<int> mem(n, 0);
    int cur = 0;
    for (int i = 0; i < n; i++) {
      while (cur < n && intervals[ridxs[i]][1] > intervals[lidxs[cur]][0])
        cur++;
      mem[ridxs[i]] = (cur == n) ? -1 : lidxs[cur];
    }
    return mem;
  }
};
