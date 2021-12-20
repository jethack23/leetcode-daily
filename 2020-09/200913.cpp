class Solution {
 public:
  vector<vector<int>> insert(vector<vector<int>>& intervals,
                             vector<int>& newInterval) {
    int cur = 0;
    // merge newInterval to existing one
    while (cur < intervals.size() && intervals[cur][1] < newInterval[0]) cur++;
    if (cur == intervals.size()) {
      intervals.push_back(newInterval);
      return intervals;
    } else if (newInterval[1] < intervals[cur][0]) {
      intervals.insert(intervals.begin() + cur, newInterval);
      return intervals;
    }
    // merge right
    if (intervals[cur][1] < newInterval[1]) {
      intervals[cur][1] = newInterval[1];
      int j = cur + 1;
      while (j < intervals.size() && intervals[j][0] <= intervals[cur][1]) {
        intervals[cur][1] = max(intervals[cur][1], intervals[j][1]);
        j++;
      }
      intervals.erase(intervals.begin() + cur + 1, intervals.begin() + j);
    }
    // merge left
    if (intervals[cur][0] > newInterval[0]) {
      intervals[cur][0] = newInterval[0];
      int j = cur - 1;
      while (j >= 0 && intervals[j][1] >= intervals[cur][0]) {
        intervals[cur][0] = min(intervals[cur][0], intervals[j][0]);
        j--;
      }
      intervals.erase(intervals.begin() + j + 1, intervals.begin() + cur);
    }
    return intervals;
  }
};