class Solution {
 public:
  vector<int> pancakeSort(vector<int>& A) {
    int n = A.size();
    vector<int> mem;
    for (int i = n; i > 0; i--) {
      int cur = 0;
      while (A[cur] != i) cur++;
      if (cur + 1 == i) continue;
      if (cur != 0) {
        mem.push_back(cur + 1);
        reverse(A.begin(), A.begin()+cur+1);
      }
      mem.push_back(i);
      reverse(A.begin(), A.begin()+i);
    }
    return mem;
  }
};
