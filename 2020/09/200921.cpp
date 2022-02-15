class Solution {
 public:
  bool carPooling(vector<vector<int>>& trips, int capacity) {
    int n = trips.size();
    int m = 0;
    vector<int> starts(n, 0);
    vector<int> ends(n, 0);
    for (int i = 0; i < n; i++) {
      m = max(m, trips[i][2]);
      starts[i] = i;
      ends[i] = i;
    }
    auto cmp_starts = [&](int a, int b) { return trips[a][1] < trips[b][1]; };
    sort(starts.begin(), starts.end(), cmp_starts);
    auto cmp_ends = [&](int a, int b) { return trips[a][2] < trips[b][2]; };
    sort(ends.begin(), ends.end(), cmp_ends);

    int scur = 0;
    int ecur = 0;
    for (int i = 0; i < m; i++) {
      while (ecur < n && trips[ends[ecur]][2] == i) {
        capacity += trips[ends[ecur]][0];
        ecur++;
      }
      while (scur < n && trips[starts[scur]][1] == i) {
        capacity -= trips[starts[scur]][0];
        scur++;
      }
      if (capacity < 0) return false;
    }
    return true;
  }
};