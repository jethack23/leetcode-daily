class Solution {
 public:
  int largestOverlap(vector<vector<int>>& A, vector<vector<int>>& B) {
    int h = A.size();
    int w = A[0].size();
    int ret = 0;
    for (int x = -(w - 1); x < w; x++) {
      for (int y = -(h - 1); y < h; y++) {
        int ol = 0;
        for (int i = 0; i < w; i++) {
          for (int j = 0; j < h; j++) {
            if (j + y < 0 || j + y >= h || i + x < 0 || i + x >= w) continue;
            if (A[j + y][i + x] && B[j][i]) {
              ol++;
            }
          }
        }
        ret = max(ret, ol);
      }
    }
    return ret;
  }
};