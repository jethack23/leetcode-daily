class Solution {
 public:
  int seq(int start, int d) {
    if (10 < d + start) return -1;
    int ret = 0;
    for (int i = 0; i < d; i++) {
      ret *= 10;
      ret += start;
      start++;
    }
    return ret;
  }
  vector<int> sequentialDigits(int low, int high) {
    int lc = low;
    int hc = high;
    int ld = 0;
    int hd = 0;
    while (lc > 0) {
      ld++;
      lc /= 10;
    }
    while (hc > 0) {
      hd++;
      hc /= 10;
    }
    vector<int> ret;
    for (int d = ld; d <= hd; d++) {
      for (int i = 1; i <= 10 - d; i++) {
        int s = seq(i, d);
        if (s < low || s > high)
          continue;
        else
          ret.push_back(s);
      }
    }
    return ret;
  }
};