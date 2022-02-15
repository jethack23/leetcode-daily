class Solution {
 public:
  vector<int> partitionLabels(string& s) {
    vector<int> left(26, -1);
    vector<int> right(26, -1);
    vector<pair<int, int>> itvs;
    vector<int> ret;
    int last = 0;
    for (int i = 0; i < s.size(); i++) {
      if (left[s[i] - 'a'] == -1) {
        left[s[i] - 'a'] = i;
        right[s[i] - 'a'] = i + 1;
      } else
        right[s[i] - 'a'] = i + 1;
    }
    for (int i = 0; i < 26; i++) {
      if (left[i] != -1) itvs.push_back({left[i], right[i]});
    }
    sort(itvs.begin(), itvs.end());
    int lb = 0;
    int ub = 0;
    for (int i = 0; i < itvs.size(); i++) {
      auto p = itvs[i];
      if (p.first >= ub) {
        if (ub > 0) ret.push_back(ub - lb);
        lb = p.first;
        ub = p.second;
      } else {
        ub = max(ub, p.second);
      }
    }
    ret.push_back(ub - lb);
    return ret;
  }
};