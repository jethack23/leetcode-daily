#include <vector>

using namespace std;

class Solution {
 public:
  void rotate(vector<vector<int>>& matrix) {
    int n = matrix.size();
    int m = n / 2;
    auto rotate_shell = [&](int i) {
      for (int j = 0; j < n - 2 * i - 1; j++) {
        // top to right
        swap(matrix[i][i + j], matrix[i + j][n - 1 - i]);
        // left to top
        swap(matrix[n - 1 - i - j][i], matrix[i][i + j]);
        // bottom to left
        swap(matrix[n - 1 - i][n - 1 - i - j], matrix[n - 1 - i - j][i]);
      }
    };
    for (int i = 0; i < m; i++) {
      rotate_shell(i);
    }
  }
};
