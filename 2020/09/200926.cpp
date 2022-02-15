class Solution {
 public:
  int findPoisonedDuration(vector<int>& timeSeries, int duration) {
    int n = timeSeries.size();
    if (n == 0) return 0;
    else if (n == 1) return duration;
    int ret = duration;
    for (int i = 1; i < n; i++) {
      ret += min(duration, timeSeries[i] - timeSeries[i-1]);
    }
    return ret;
  }
};